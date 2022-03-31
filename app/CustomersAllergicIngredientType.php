<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CustomersAllergicIngredientType extends Model
{
    //
	
	 public function user()
	{
		return $this->belongsTo('App\IngredientType', 'customer_id');
	}	
	
}
