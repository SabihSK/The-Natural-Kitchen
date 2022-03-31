<?php

namespace App\Http\Controllers;

use App\Ingredient;
use Illuminate\Http\Request;

class IngredientController extends Controller
{
    public function allIngredients()
    {
        return Ingredient::all()->groupBy('id')->map(function($item){
            return $item[0];
        });
    }
}
