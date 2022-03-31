<?php

namespace App\Http\Controllers;

use App\Ingredient;
use App\Meal;
use App\MealType;
use App\Plan;
use App\Week;
use Illuminate\Http\Request;

class MealController extends Controller
{
    public function duplicate($meal_id)
    {
        $meal = Meal::findOrFail($meal_id);
        $new = $meal->replicate();
        $new->name = $new->name . ' (Duplicate)';
        $new->push();

        $plans = $meal->plans;
        $new->plans()->sync($plans->pluck('id'));

        $ings = $meal->ingredients;
        foreach ($ings as $ing) {
            $new->ingredients()->attach($ing->id, ['amount' => $ing->pivot->amount, 'removable' => $ing->pivot->removable, 'editable' => $ing->pivot->editable]);
        }

        return redirect()->route('voyager.meals.edit', $new->id);
    }

    public function all()
    {
        return MealType::all()->each(function(&$mealType){
            $mealType->meals = Plan::with('meals')->get();
        });
    }

    public function filteredList($meal_type_id, $plan_id)
    {
        return Meal::where('meal_type_id', $meal_type_id)->whereHas('plans', function ($q) use($plan_id) {$q->where('plans.id', $plan_id);})->get();
    }

    public function getAllIngredients() {
        return Ingredient::with('products')->orderBy('name','ASC')->get();
    }

    public function getIngredients($meal_id) {
        $ingredients = Meal::whereId($meal_id)->with('ingredients')->first();

        return $ingredients;
    }

    public function addIngredient(Request $request) {
        $meal_id = $request->get('meal_id');
        $ingredient_id = $request->get('ingredient_id');
        $amount = $request->get('amount');

        $meal = Meal::find($meal_id);

        if(!$meal) {
            return [
                'status' => 0,
                'message' => 'Meal does not exist!'
            ];
        }

        $meal->ingredients()->attach($ingredient_id, ['amount' => $amount]);
        $meal->total_calories = $meal->getTotalCalories();
        $meal->save();

    }

    public function updateMealIngredients(Request $request) {
        $meal_ingredients_data = $request->get('ingredients');
        $meal_cals = $request->get('meal_cals');
        $meal_fats = $request->get('meal_fats');
        $meal_proteins = $request->get('meal_proteins');
        $meal_total_cost = $request->get('meal_total_cost');
        $meal_carbs = $request->get('meal_carbs');
        $meal_id = $request->get('meal_id');
        $meal = Meal::find($meal_id);
        $meal->ingredients()->detach();

        foreach ($meal_ingredients_data as $key => $ing_data) {
            $meal->ingredients()->attach($ing_data['id'], ['amount' => $ing_data['pivot']['amount'], 'removable' => $ing_data['pivot']['removable'], 'editable' => $ing_data['pivot']['editable']]);
        }
        $meal->total_calories = $meal_cals;
        $meal->total_fats = $meal_fats;
        $meal->total_proteins = $meal_proteins;
        $meal->total_cost = $meal_total_cost;
        $meal->total_carbs = $meal_carbs;
        $meal->save();

        return $meal;
    }

    public function getAllMeals() {
        return Meal::all();
    }

    public function mealTypeDayMeals($week_id, $day, $meal_type_id)
    {
        $meal = Meal::whereMealTypeId($meal_type_id)->whereHas('week_meals', function($q) use ($week_id, $meal_type_id, $day) {
            return $q->where(['week_id' => $week_id, 'meal_type_id' => $meal_type_id, 'date' => $day]);
        })->with(['ingredients', 'week_meals' => function($q) use ($week_id, $meal_type_id, $day) {
            return $q->where(['week_id' => $week_id, 'meal_type_id' => $meal_type_id, 'date' => $day]);
        }])->get();

        $meal->additional_ingredients = [];

        return $meal;

    }

    public function getOptionMatchingMeals(Request $request)
    {
        $data = $request->all();
        $plan_id = $data['plan_id'];
        $mealTypeId = $data['mealTypeId'];
        $data = $data['data'];

        $weeks = Week::all();
        $programIngTypesIds = array_column($data, 'ingredient_type_id');
        $plan = Plan::find($plan_id);
        $meals = [];
        $weeks->each(function($week) use (&$meals, $mealTypeId, $programIngTypesIds, $plan){
            $plan->load(['meals' => function ($q) use ($mealTypeId, $programIngTypesIds, $week) {
                $q->where('meal_type_id', $mealTypeId);
                $q->whereHas('week_meals', function($qq) use($week){
                    $qq->whereWeekId($week->id);
                });
                foreach ($programIngTypesIds as $ingTypeId) {
                    $q->whereHas('ingredients', function ($qq) use ($ingTypeId) {
                        $qq->where('ingredient_type_id', $ingTypeId);
                    });
                }
            }]);
            $meals[$week->name] = $plan->meals;
        });

        return response()->json($meals);
    }
}
