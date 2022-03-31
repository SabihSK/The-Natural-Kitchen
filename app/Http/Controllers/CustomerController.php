<?php

namespace App\Http\Controllers;

use App\Customer;
use DB;
use App\CustomersAllergicIngredientType;
use App\CustomerIngredientsAmount;
use App\Ingredient;
use App\IngredientType;
use App\Meal;
use App\MealType;
use Illuminate\Http\Request;

class CustomerController extends Controller
{
    public function show($id)
    {
        return response()->json(Customer::find($id));
    }

    public function update($id, Request $request)
    {
        $customer = Customer::find($id);

        $data = $request->only(\Illuminate\Support\Facades\Schema::getColumnListing('customers'));

        $success = $customer->update($data);

        return response()->json([
            'success' => $success,
            'message' => $success ? 'Customer calories settings updated successfully' : 'Error updating Customer calories settings'
        ]);
    }
    public function getAllCustomers()
    {
        return Customer::active()->with('customer_meals')->get();
    }

    public function getAllergicIngredients($customer_id) {
        $customer = Customer::find($customer_id);
        $allergicIngredients = $customer->allergicIngredients->load('ingredient_type');
        $allergicIngredientTypes = $customer->allergicIngredientTypes;

        $ingIds = $allergicIngredients->pluck('id')->toArray();
        $ingTIds = $allergicIngredientTypes->pluck('id')->toArray();


        /*foreach ($allergicIngredients as $all_ing) {
            $dataI[$all_ing->ingredient_type->id][] = $all_ing->id;
        }
        foreach ($allergicIngredientTypes as $all_ingT) {
            $dataIT[$all_ingT->id][] = $all_ingT->id;
        }*/

        $ings_with_types = IngredientType::with('ingredients')->get();

        $allIngredientsWithTypes = $ings_with_types->groupBy(function($item) use($ingIds, $ingTIds){
            return $item->id;
        })->map(function(&$ingType, $ingTypeId) use($ingIds, $ingTIds){

            $ingType[0]->checked = in_array($ingTypeId, $ingTIds);

            foreach($ingType[0]->ingredients as &$ing) {
                $ing->checked = in_array($ing->id, $ingIds);
            }

            return $ingType[0];
        });

        $allIngredientsWithTypes->each(function(&$item){
            $ingredients = $item->ingredients->groupBy('id')->map(function($ing) {

                return $ing[0];
            });

            unset($item->ingredients);
            $item->ingredients = $ingredients;

        });

        return $allIngredientsWithTypes;
    }

    public function updatePlanAllergicIngredients(Request $request) {
        $customer_ingredients_data = $request->get('ingredients');
        $customer_id = $request->get('customer_id');
        $remove = $request->get('remove');
        $customer = Customer::find($customer_id);
        $ingTypeId = $request->get('ingTypeId');

        /*if(empty($customer_ingredients_data)) {
            $customer->allergicIngredients()->detach();
            return [];
        }*/

        $message = '';

//        dd($remove == 1 ? ' Remove => True' : 'Remove => False');

        if($remove == 0) {
            if($ingTypeId != 0) {
                $customer->allergicIngredientTypes()->detach($ingTypeId);
                $message = __("Customer's allergic ingredient Type removed successfully.");
        }
            else {
                $customer->allergicIngredients()->detach($customer_ingredients_data);
                $message = __("Customer's allergic ingredient removed successfully.");
            }
        }
        else {
            if($ingTypeId != 0) {
                $ingIds = Ingredient::whereIngredientTypeId($ingTypeId)->get()->pluck('id');
                $customer->allergicIngredients()->detach($ingIds);
                $customer->allergicIngredientTypes()->sync($ingTypeId, false);
                $message = __("Customer's allergic ingredient Type added successfully.");
        }
            else {
                $customer->allergicIngredients()->sync($customer_ingredients_data, false);
                $message = __("Customer's allergic ingredient added successfully.");
            }
        }

        return [
            'status' => 1,
            'message' => $message
        ];
    }
	/*
		allergic 
	*/
	public function getAllergicIngredientsall(){
		$customer_allergic = DB::table('customers_allergic_ingredient_types')
       ->join('ingredient_types', 'ingredient_types.id', '=', 'customers_allergic_ingredient_types.ingredient_type_id')
       ->select('ingredient_types.name', 'customers_allergic_ingredient_types.customer_id')
       ->get();
		return response()->json($customer_allergic);
	}
	

    public function getValidMeals($customer_id, $meal_type_id) {
        $customer = Customer::find($customer_id);
        $meals = $customer->getValidMeals($meal_type_id);

        return $meals;
    }

    public function getWeekMeals($customer_id, $week_id)
    {
//        $customer = Customer::find($customer_id);
    }

    public function simple()
    {
        return Customer::active()->get()->pluck('fullname', 'id');
    }

    public function getDislikedIngredients($customer_id) {
        $customer = Customer::find($customer_id);
        $dislikedIngredients = $customer->dislikedIngredients;

        return $dislikedIngredients;
    }

    public function updateDislikedIngredients(Request $request) {
        $customer_ingredients_data = $request->get('ingredients');
        $customer_id = $request->get('customer_id');
        $customer = Customer::find($customer_id);

        if(empty($customer_ingredients_data)) {
            $customer->dislikedIngredients()->detach();
            return [];
        }

        $ingredients_ids = array_column($customer_ingredients_data, 'id');
        $customer->dislikedIngredients()->sync($ingredients_ids);

        return $customer;
    }

    public function updateIngredientTypesAmounts(Request $request)
    {
        $customer_ingredient_types_data = $request->get('ingredient_types_amounts');
        $customer_id = $request->get('customer_id');
        $customer = Customer::find($customer_id);

        if(empty($customer_ingredient_types_data)) {
            $customer->ingredientTypesAmounts()->detach();
            return [];
        }

        $customer->ingredientTypesAmounts()->detach();
        foreach ($customer_ingredient_types_data as $ing_type) {
            $customer->ingredientTypesAmounts()->attach([
                $ing_type['ingredient_type']['id'] => [
                    'meal_type_id' => $ing_type['meal_type']['id'],
                    'amount' => $ing_type['amount']
                ]
            ]);
        }

        return $customer;
    }

    public function getIngredientTypes($customer_id)
    {
        $ingredient_types_amounts = CustomerIngredientsAmount::whereCustomerId($customer_id)->with(['ingredientType', 'mealType', 'customer'])->get();

        return $ingredient_types_amounts;
    }

    public function getMealTypes($id)
    {
        $customer = Customer::find($id);

        $meal_types = MealType::main()->get();
        $customer_meal_types = $customer->mealTypes->pluck('id')->toArray();

        $meal_types->each(function(&$mt) use ($customer_meal_types){
            $mt->checked = in_array($mt->id, $customer_meal_types);
        });

        return response()->json($meal_types);
    }

    public function addMealType(Request $request)
    {
        $customer_id = $request->get('customer_id');
        $meal_type_id = $request->get('meal_type_id');
        $checked = $request->get('checked');

        $customer = Customer::find($customer_id);

        try {
            if($checked == 1) {
                $customer->mealTypes()->attach($meal_type_id);
                $message = 'Customer Meal Type <b><u>added</u></b> successfully';
            }
            else {
                $customer->mealTypes()->detach($meal_type_id);
                $message = 'Customer Meal Type <b><u>removed</u></b> successfully';
            }

            return response()->json([
                'success' => true,
                'message' => $message
            ]);
        }
        catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error updating customer meal types'
            ]);
        }

    }
}
