<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\Pivot;

class WeekMeal extends Pivot
{
    protected $table = 'week_meals';

    public function meal()
    {
        return $this->belongsTo(Meal::class);
    }

    public function week()
    {
        return $this->belongsTo(Week::class);
    }

    public function customers_meals()
    {
        return $this->hasMany(CustomerMeal::class, 'week_meal_id');
    }

    public function meal_type()
    {
        return $this->belongsTo(MealType::class);
    }
}
