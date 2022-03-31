<?php

namespace App\Observers;

use App\Kitchen;
use App\Meal;
use App\MealType;

class MealTypeObserver
{
    public function created()
    {
        $meal_types = MealType::all();
        $kitchens = Kitchen::all();
        $meal_types->each(function ($mt) use ($kitchens) {
            $kitchens->each(function ($k) use ($mt) {
                if (Meal::custom($mt, $k)->doesntExist()) {
                    Meal::create([
                        'name' => 'Custom '.$mt->name.' Meal (' . $k->name . ')',
                        'meal_type_id' => $mt->id,
                        'kitchen_id' => $k->id,
                        'custom' => 1
                    ]);
                }
            });
        });
    }
}
