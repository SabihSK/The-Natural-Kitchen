<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\Pivot;
use Illuminate\Support\Facades\Log;

class CustomerMeal extends Pivot
{
    protected $table = 'customer_meals';

    public function week_meals()
    {
        return $this->belongsTo(WeekMeal::class, 'week_meal_id');
    }

    public static function hasWeekMealsPublished($week_id)
    {
        return static::whereHas('week_meals', function($q) use($week_id){
            return $q->where('week_id', $week_id);
        })->count() > 0;
    }

    public function customer()
    {
        return $this->belongsTo(Customer::class);
    }

    public function additional_ingredients()
    {
        return $this->belongsToMany(Ingredient::class, 'additional_ingredients', 'customer_meal_id', 'ingredient_id')->withPivot('amount')->withTimestamps();
    }

    public function custom_amounts()
    {
        return $this->belongsToMany(IngredientType::class, 'customer_meal_amounts', 'customer_meal_id', 'ingredient_type_id')->withPivot('amount')->withTimestamps();
    }

    public function prepare()
    {
        $this->cooked = 1;
        $this->save();
    }

    public function unPrepare()
    {
        $this->cooked = 0;
        $this->save();
    }

    public function getTotalCalories() {
        $ingredients = $this->week_meals->meal->ingredients;
        $additional_ingredients = $this->additional_ingredients;

        $total_calories = array_reduce($ingredients->toArray(), function($i, $obj){
            return $i += $obj['calories']*$obj['pivot']['amount']/100;
        });

        $additional_calories = array_reduce($additional_ingredients->toArray(), function($i, $obj){
            return $i += $obj['calories']*$obj['pivot']['amount']/100;
        });

        return number_format(($total_calories + $additional_calories), 2);
    }

    public function getTotalFats() {
        $ingredients = $this->week_meals->meal->ingredients;
        $additional_ingredients = $this->additional_ingredients;

        $total_calories = array_reduce($ingredients->toArray(), function($i, $obj){
            return $i += $obj['fat']*$obj['pivot']['amount']/100;
        });

        $additional_calories = array_reduce($additional_ingredients->toArray(), function($i, $obj){
            return $i += $obj['fat']*$obj['pivot']['amount']/100;
        });

        return round($total_calories + $additional_calories);
    }

    public function getTotalProteins() {
        $ingredients = $this->week_meals->meal->ingredients;
        $additional_ingredients = $this->additional_ingredients;

        $total_calories = array_reduce($ingredients->toArray(), function($i, $obj){
            return $i += $obj['protein']*$obj['pivot']['amount']/100;
        });

        $additional_calories = array_reduce($additional_ingredients->toArray(), function($i, $obj){
            return $i += $obj['protein']*$obj['pivot']['amount']/100;
        });

        return round($total_calories + $additional_calories);
    }

    public function getTotalCarb() {
        $ingredients = $this->week_meals->meal->ingredients;
        $additional_ingredients = $this->additional_ingredients;

        $total_calories = array_reduce($ingredients->toArray(), function($i, $obj){
            return $i += $obj['carbohydrates']*$obj['pivot']['amount']/100;
        });

        $additional_calories = array_reduce($additional_ingredients->toArray(), function($i, $obj){
            return $i += $obj['carbohydrates']*$obj['pivot']['amount']/100;
        });

        return round($total_calories + $additional_calories);
    }

    public static function completeMissingCalories($meal, $consumable_cals, $calories_plusminus)
    {
        $extra = [];

        Log::info("Entered completeMissingCalories()");
        if($meal->meal->total_calories < ($consumable_cals[$meal->meal->meal_type_id] - ($calories_plusminus/2))) {
            $missing_cals = $consumable_cals[$meal->meal->meal_type_id] - $meal->meal->total_calories;
            $meal->load('meal.ingredients');
            $editable_ings = $meal->meal->ingredients->filter(function($ing){
                return $ing->pivot->editable == 1;
            });

            if(count($editable_ings) > 0)
            {
                $missing_cals = $missing_cals/count($editable_ings);
                foreach ($editable_ings as $ing) {
                    if($ing->calories > 0)
                    {
                        $extra_amount = $missing_cals*100/($ing->calories);
                        $extra[$ing->id] = [
                            'amount' => number_format($extra_amount, 2)
                        ];
                    }
                }

                Log::info("Extra Amounts for customer meal");
                Log::info($extra);
            }
        }

        return $extra;
    }
}
