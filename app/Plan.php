<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Plan extends Model
{
    public function prohibitedIngredients() {
        return $this->belongsToMany(Ingredient::class, 'plan_prohibited_ingredients')->withTimestamps();
    }

    public function prohibitedIngredientTypes() {
        return $this->belongsToMany(IngredientType::class, 'plan_prohibited_ingredient_types')->withTimestamps();
    }

    public function meals() {
        return $this->belongsToMany(Meal::class, 'plan_meals')->withTimestamps();
    }
}
