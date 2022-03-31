<?php

namespace App\Observers;

use App\Meal;
use App\PlanMeal;

class MealObserver
{
    public function deleting(Meal $meal)
    {
        $meal->plans()->detach();
    }
}
