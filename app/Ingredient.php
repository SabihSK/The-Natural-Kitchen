<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Ingredient extends Model
{
    protected $table = 'ingredients';

    public function meals()
    {
        return $this->belongsToMany(Meal::class, 'ingredient_meal', 'meal_id', 'ingredient_id');
    }
	
	public function products (){
		return $this->hasOne(Products::class, 'productname','id');
	}
	
	
    public function ingredient_type()
    {
        return $this->belongsTo(IngredientType::class);
    }
}
