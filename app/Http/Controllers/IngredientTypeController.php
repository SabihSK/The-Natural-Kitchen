<?php

namespace App\Http\Controllers;

use App\IngredientType;
use Illuminate\Http\Request;

class IngredientTypeController extends Controller
{
    public function allWithIngredients()
    {
        return IngredientType::with('ingredients')->get()->groupBy('id');
    }

    public function allIngredientTypes()
    {
        return IngredientType::all()->groupBy('id')->map(function($item){
            return $item[0];
        });
    }
}
