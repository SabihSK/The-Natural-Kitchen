<?php

namespace App\Http\Controllers;

use App\Meal;
use App\Week;
use App\WeekMeal;
use Carbon\Carbon;
use Illuminate\Http\Request;

class WeekMealController extends Controller
{
    public function getWeekDayMeals($week_id, $day, $meal_type_id = null)
    {
        $day = Carbon::parse($day)->format('Y-m-d');
        $whereArr = ['week_id' => $week_id, 'date' => $day];
        $whereArr = !is_null($meal_type_id) ? array_merge($whereArr, ['meal_type_id' => $meal_type_id]) : $whereArr;
            $week_meals = WeekMeal::where($whereArr)->get()->load('meal.ingredients', 'meal_type')->groupBy('meal_type_id');

        return $week_meals;
    }

    public function getWeekDayMealsList($week_id, $day, $meal_type_id)
    {
        return Meal::whereHas('week_meals', function($q) use ($week_id, $day, $meal_type_id) {
            return $q->where(['week_id' => $week_id, 'date' => $day, 'meal_type_id' => $meal_type_id]);
        })->with('ingredients')->with(['week_meals' => function($q) use ($week_id, $day, $meal_type_id){$q->where(['week_id' => $week_id, 'date' => $day, 'meal_type_id' => $meal_type_id]);}])->get();
    }

    public function getWeekMealCount($week_id)
    {
        return WeekMeal::whereWeekId($week_id)->count();
    }

    public function bulkAdd(Request $request)
    {
        $week_id = $request->get('week_id');
        $meal_type_id = $request->get('meal_type_id');
        $date = $request->get('date');
        $meals = $request->has('meals') ? $request->get('meals') : [];
        $date_formatted = Carbon::parse($date)->format('Y-m-d');

        foreach ($meals as $meal_id) {
            WeekMeal::firstOrCreate([
                'week_id' => $week_id,
                'meal_type_id' => $meal_type_id,
                'date' => $date_formatted,
                'meal_id' => $meal_id
            ]);
        }

        return Week::find($week_id)->meals;
    }

    public function durationMeals($kitchen_id, $start_date, $end_date)
    {
        $week_meals = WeekMeal::whereBetween('date', [$start_date, $end_date])
            ->with([
                'week',
                'meal.plans',
                'customers_meals.week_meals' ,
                'customers_meals.customer' => function($q){$q->select(['customers.id', 'customers.fullname']);},
                'customers_meals.customer.allergicIngredients' ,
                'customers_meals.customer.allergicIngredientTypes' ,
                'customers_meals.additional_ingredients'
            ])->whereHas('meal', function($q) use($kitchen_id){return $q->whereKitchenId($kitchen_id);})
            ->withCount('customers_meals')
            ->get()->filter(function($item) { return $item->customers_meals_count > 0; })
            ->groupBy(['date', 'meal_id']);

        return $week_meals;
    }
}
