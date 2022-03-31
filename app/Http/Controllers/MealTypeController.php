<?php

namespace App\Http\Controllers;

use App\Meal;
use App\MealType;
use Illuminate\Http\Request;

class MealTypeController extends Controller
{
    public function all()
    {
        return MealType::all()->groupBy('id')->map(function($item){
            return $item[0];
        });
    }

    public function getAllMealTypes($without_relation = 0) {
        if($without_relation == '1') {
            $all_meals = Meal::all();
            $meal_types = MealType::all();
            foreach ($meal_types as &$meal_type) {
                $meal_type->meals = $all_meals;
            }

            return $meal_types;
        }
        return MealType::with('meals')->get();
    }
}
