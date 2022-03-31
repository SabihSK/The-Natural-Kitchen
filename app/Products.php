<?php

namespace App;

use App\Observers\KitchenObserver;
use Illuminate\Database\Eloquent\Model;

class Products extends Model
{
	    protected $table = 'products';
	
		
		public function ingredient (){
			return $this->belongsTo(Ingredient::class,'id','productname');
		}	
	
	
}
