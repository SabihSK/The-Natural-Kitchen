<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\Pivot;

class AdditionalIngredient extends Pivot
{
    protected $table = 'additional_ingredients';

    protected $touches = ['customer_meal'];

    public function ingredient()
    {
        return $this->belongsTo(Ingredient::class);
    }

    public function customer_meal()
    {
        return $this->belongsTo(CustomerMeal::class);
    }
}
