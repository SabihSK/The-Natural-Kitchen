<?php

namespace App\Http\Controllers;

use App\Customer;
use App\CustomerMeal;
use App\IngredientType;
use App\Kitchen;
use App\MealType;
use App\Week;
use App\WeekMeal;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use TCG\Voyager\Facades\Voyager;

class CustomerMealController extends Controller
{
    public function index()
    {
        $dataType = 1;
        $dataTypeContent = 1;
        $isModelTranslatable = 1;
        $search = 1;
        $orderBy = 1;
        $orderColumn = 1;
        $sortOrder = 1;
        $searchable = 1;
        $isServerSide = 1;
        $defaultSearchKey = 1;
        $view = 'voyager::customer-meals.browse';

        return Voyager::view($view, compact(
            'dataType',
            'dataTypeContent',
            'isModelTranslatable',
            'search',
            'orderBy',
            'orderColumn',
            'sortOrder',
            'searchable',
            'isServerSide',
            'defaultSearchKey'
        ));
    }

    public function getWeekMeals($week_id)
    {
        $meals = [];
        Customer::active()->chunk(20, function($customers) use (&$meals, $week_id){
            $meal_types = MealType::all();
            $week = Week::find($week_id);

            foreach ($customers as &$customer) {
                $valid_meals = $customer->selectSetOfMeals($week, $meal_types);
                $meals[] = $valid_meals;
            }
        });

        return $this->getMissingWeekMeals($week_id);
    }

    public function setWeekMeals(Request $request)
    {
        $week_id = $request->get('week_id');
        $customers_ids = $request->get('customers_ids');
        $meal_types = MealType::all();
        $week = Week::find($week_id);
        $attach = !$request->has('attach');

        $result = false;

        try {
            DB::beginTransaction();
            if(count($customers_ids) > 0) {
                CustomerMeal::whereIn('customer_id', $customers_ids)
                    ->whereHas('week_meals',
                        function($q) use
                        ($week_id){
                            return $q->whereWeekId($week_id);
                        })->delete() ;

                if(CustomerMeal::whereIn('customer_id', $customers_ids)->whereHas('week_meals', function($q) use ($week_id){
                    return $q->whereWeekId($week_id);
                })->doesntExist()) {
                    Customer::active()->whereIn('id', $customers_ids)->each(function($customer) use ($meal_types, $week){
                        $customer->selectSetOfMeals($week, $meal_types, true);
                    });
                }
            }
            else {
                CustomerMeal::whereHas('week_meals',
                    function($q) use
                    ($week_id){
                        return $q->whereWeekId($week_id);
                    })->delete();

                if(CustomerMeal::whereHas('week_meals', function($q) use ($week_id){
                    return $q->whereWeekId($week_id);
                })->doesntExist()) {
                    Customer::active()->each(function($customer) use ($meal_types, $week){
                        $customer->selectSetOfMeals($week, $meal_types, true);
                    });
                }
            }


            $result = $this->getMissingWeekMeals($week_id);
            DB::commit();
        }
        catch (\Exception $e) {
            Log::error($e->getMessage());
            DB::rollBack();
        }

        return $result;
    }

    public function getMissingWeekMeals($week_id)
    {
        $week_days_count = count(Week::find($week_id)->days);
        $meal_types = MealType::all();
        $week = Week::find($week_id);

        return Customer::withMissingMeals($week, $week_days_count, $meal_types);
    }

    public function getCustomerWeekMeals($customer_id, $week_id)
    {
        $week_days = Week::find($week_id)->days;
        $meal_types = MealType::all()->pluck('id');
        $week_meals = [];
        foreach ($week_days as $day) {
            foreach ($meal_types as $meal_type_id) {
                $week_meal = CustomerMeal::where('customer_id', $customer_id)->whereHas('week_meals', function($q) use ($week_id, $meal_type_id, $day){
                    return $q->where(['week_id' => $week_id, 'meal_type_id' => $meal_type_id, 'date' => Carbon::parse($day)->format('Y-m-d')]);
                })->with(['week_meals' => function($q) use ($week_id, $day, $meal_type_id){$q->where(['week_id' => $week_id, 'date' => Carbon::parse($day)->format('Y-m-d'), 'meal_type_id' => $meal_type_id]);}])->with('week_meals.meal.ingredients', 'additional_ingredients')->first();
                $week_meal = !empty($week_meal->week_meals->meal) ? array_merge($week_meal->week_meals->meal->toArray(), ['week_meals' => $week_meal->week_meals, 'ingredients' => $week_meal->week_meals->meal->ingredients, 'additional_ingredients' => $week_meal->additional_ingredients, 'customer_meal_id' => $week_meal->id, 'customer_meal_total_calories' => $week_meal->total_calories, 'notes' => $week_meal->notes]) : [];
                $week_meals[$day][$meal_type_id] = $week_meal;
            }
        }
        $customer = Customer::with('pausedDays', 'allergicIngredients', 'allergicIngredientTypes', 'plan')->find($customer_id);
        $customer->mealTypes = $customer->mealTypes->pluck('id');
        $customer->mealsTypesCalories();

        $missings = [];
        foreach ($week_meals as $week_meal) {
            foreach ($week_days as $day) {
                foreach ($customer->myMealTypes() as $meal_type) {
                    $mt = $meal_type['id'] ?? $meal_type;
                    if(!isset($week_meals[$day][$mt]) || count($week_meals[$day][$mt]) == 0) {
                        $missings[$day][$mt] = $customer->selectSetOfMealsNoLimitation($week_id, $day, $mt);
                    }
                }
            }
        }

        return [
            'customer' => $customer,
            'meals' => $week_meals,
            'missing_meals' => $missings
        ];
    }

    public function missingMealReason($customer_id, $week_id, $day, $meal_type_id)
    {
        return Customer::find($customer_id)->selectSetOfMealsNoLimitation($week_id, $day, $meal_type_id);
    }

    public function allIngredients($id)
    {
        $customer_meal = CustomerMeal::with( 'week_meals.meal.ingredients', 'additional_ingredients')->find($id);

        return $customer_meal;

    }

    public function saveAdditionalIngredients(Request $request)
    {
        $week_meal_id = $request->get('week_meal_id');
        $add_ing = $request->has('add_ing') ? $request->get('add_ing') : [];
        $total_calories = $request->get('total_calories');
        $customer_meal_id = $request->get('customer_meal_id');
        $customer_id = $request->get('customer_id');

        $add_ingredients_arr = [];
        if($customer_meal_id != 0)
        {
            $customer_meal = CustomerMeal::find($customer_meal_id);
            if($customer_meal) $customer_meal->delete();
        }

        $customer_meal = CustomerMeal::create(['customer_id' => $customer_id, 'week_meal_id' => $week_meal_id]);

        if(count($add_ing) > 0) {
            foreach ($add_ing as $ing) {
                if($ing['pivot']['amount'] > 0) {
                    $add_ingredients_arr[]  = ['customer_meal_id' => $customer_meal->id, 'ingredient_id' => $ing['id'], 'amount' => $ing['pivot']['amount']];
                }
            }
        }

        $customer_meal->load('week_meals.meal');
        if($customer_meal->week_meals->meal->custom == 1) {
            $customer_meal->load('customer');
            $custom_amounts = $customer_meal->customer->ingredientTypesAmounts->groupBy('pivot.meal_type_id');
            if(count($custom_amounts) > 0) {
                 if(isset($custom_amounts[$customer_meal->week_meals->meal->meal_type_id])) {
                     $ingTypeAmountList = $custom_amounts[$customer_meal->week_meals->meal->meal_type_id];
                     foreach($ingTypeAmountList as $ingTypeAmount) {
                         $customer_meal->custom_amounts()->attach($ingTypeAmount->id, ['amount' => $ingTypeAmount->pivot->amount]);
                     }
                 }
            }
        }
        else {
            $customer_meal->additional_ingredients()->attach($add_ingredients_arr);
            $customer_meal->total_calories = $total_calories;
        }
        if($customer_meal->save()) {
            $week_meal = $customer_meal->load('week_meals.week', 'week_meals.meal.ingredients', 'additional_ingredients');
            $week = $week_meal->week_meals->week;
            $week_meal = !empty($week_meal->week_meals->meal) ? array_merge($week_meal->week_meals->meal->toArray(), ['customer_id' => $week_meal->customer_id, 'week_meals' => $week_meal->week_meals, 'ingredients' => $week_meal->week_meals->meal->ingredients, 'additional_ingredients' => $week_meal->additional_ingredients, 'customer_meal_id' => $week_meal->id, 'customer_meal_total_calories' => $week_meal->total_calories]) : [];
            return response()->json(['status' => 1, 'customer_meal' => $week_meal, 'complete_meals' => Customer::find($customer_id)->hasCompleteWeekMeals($week)]);
        }

        return response()->json(['status'   =>  0]);
    }

    public function getCalendar($kitchen_id)
    {
        if(is_null($kitchen_id))
            return 'No Kitchen Selected!!';

        return view('vendor.voyager.custom.calendar', ['kitchen' => Kitchen::find($kitchen_id)]);
    }

    public function setMealPreparation(Request $request)
    {
        $customer_meal_id = $request->get('customer_meal_id');
        $prepared = $request->get('prepared');
        if($prepared)
            CustomerMeal::find($customer_meal_id)->prepare();
        else
            CustomerMeal::find($customer_meal_id)->unPrepare();
    }

    public function delete(Request $request)
    {
        $cmid = $request->get('cmid');
        $deleted = CustomerMeal::find($cmid)->delete();

        return $deleted ? 1 : 0;
    }

    public function printLabel($customer_meal_id)
    {
        $c_ids = explode('+', $customer_meal_id);
        $meals_info = CustomerMeal::whereIn('id', $c_ids)->with('custom_amounts', 'week_meals.meal.ingredients', 'week_meals.meal_type')->get();

        $ing_types = IngredientType::all()->groupBy('id')->map(function($item){
            return $item[0];
        });

//        dd($meals_info[0]->customer->allExcludedIngredients());

        return view('vendor.voyager.custom.meal_label', compact('meals_info', 'ing_types'));
    }

    public function printData($customer_meal_id)
    {
        $c_ids = explode('+', $customer_meal_id);
        $meals_info = CustomerMeal::whereIn('id', $c_ids)->with('customer.allergicIngredients', 'customer.allergicIngredientTypes', 'week_meals.meal.ingredients', 'week_meals.meal_type', 'additional_ingredients')->get();
        $ing_types = IngredientType::all()->groupBy('id')->map(function($item){
            return $item[0];
        });

        return view('vendor.voyager.custom.meal_data', compact('meals_info', 'ing_types'));
    }

    public function bulkPrepareMeals(Request $request)
    {
        $cm_ids = $request->get('cm_ids');
        $cm_ids = explode('+', $cm_ids);

        return CustomerMeal::whereIn('id', $cm_ids)->update(['cooked' => 1]);
    }

    public function customersMealsForDate($date = null)
    {
        if(empty($date)) {
            $date = Carbon::today()->format('Y-m-d');
        }

        return CustomerMeal::with('week_meals.meal', 'week_meals.meal_type', 'customer.mealTypes', 'customer.plan')->whereHas('week_meals', function($q) use($date){$q->where('date',$date);})->get()->groupBy('customer.id');
    }

    public function CustomersMealsReport($date)
    {
        return view('vendor.voyager.custom.meals-report', ['customers_meals' => $this->customersMealsForDate($date), 'all_meal_types' => MealType::all(), 'date' => $date]);
    }
}
