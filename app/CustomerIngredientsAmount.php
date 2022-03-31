<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\Pivot;

class CustomerIngredientsAmount extends Pivot
{
    public function ingredientType()
    {
        return $this->belongsTo(IngredientType::class);
    }
    public function mealType()
    {
        return $this->belongsTo(MealType::class);
    }
    public function customer()
    {
        return $this->belongsTo(Customer::class);
    }
}
