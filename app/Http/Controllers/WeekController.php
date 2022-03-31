<?php

namespace App\Http\Controllers;

use App\CustomerMeal;
use App\Week;
use App\WeekMeal;
use Illuminate\Http\Request;

class WeekController extends Controller
{
    public function getWeekDays($week_id) {
        $week = Week::with('meals')->whereId($week_id)->first();

        return $week;
    }

    public function addMeal(Request $request) {
        $week_id = $request->get('week_id');
        $meal_id = $request->get('meal_id');
        $meal_type_id = $request->get('meal_type_id');
        $date = $request->get('date');

        $week = Week::find($week_id);
        $week->meals()->attach($meal_id, ['meal_type_id' => $meal_type_id, 'date' => $date]);

        return $week->meals;

    }

    public function removeMeal(Request $request) {
        $week_id = $request->get('week_id');
        $meal_id = $request->get('meal_id');
        $meal_type_id = $request->get('meal_type_id');
        $date = $request->get('date');

        $week = Week::find($week_id);
        $week_meal = WeekMeal::where([
            'week_id' => $week_id,
            'meal_id' => $meal_id,
            'meal_type_id' => $meal_type_id,
            'date' => $date
        ]);
        if($week_meal->count() > 0) {
            CustomerMeal::whereWeekMealId($week_meal->first()->id)->delete();
            $week_meal->delete();
        }

        return $week->meals;
    }

    public function getAllWeeks()
    {
        $weeks = Week::orderBy('id', 'Desc')->withCount('meals')->get();
        /*foreach ($weeks as &$week) {
            $week->meals_published = CustomerMeal::hasWeekMealsPublished($week->id);
        }*/

        return $weeks;
    }
}
