<?php

namespace App;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class Meal extends Model
{
    protected $table = 'meals';

    protected $casts = [
        'notes' => 'array'
    ];

    protected $guarded = [];

//    /**
//     * The "booting" method of the model.
//     *
//     * @return void
//     */
//    protected static function boot()
//    {
//        parent::boot();
//
//        static::addGlobalScope('custom', function (Builder $builder) {
//            $builder->where('custom', 0);
//        });
//    }

    public function ingredients() {
//        return $this->hasManyThrough(Ingredient::class, IngredientMeal::class);
        return $this->belongsToMany(Ingredient::class)->with('products')->withPivot('amount', 'removable', 'editable');
    }
	

	

    public function getTotalCalories() {
        $ingredients = $this->ingredients;
        $total_calories = array_reduce($ingredients->toArray(), function($i, $obj){
            return $i += $obj['calories']*$obj['pivot']['amount']/100;
        });

        return round($total_calories);
    }

    public function getTotalFats() {
        $ingredients = $this->ingredients;
        $total_calories = array_reduce($ingredients->toArray(), function($i, $obj){
            return $i += $obj['fat']*$obj['pivot']['amount']/100;
        });

        return round($total_calories);
    }

    public function getTotalProteins() {
        $ingredients = $this->ingredients;
        $total_calories = array_reduce($ingredients->toArray(), function($i, $obj){
            return $i += $obj['protein']*$obj['pivot']['amount']/100;
        });

        return round($total_calories);
    }

    public function getTotalCarb() {
        $ingredients = $this->ingredients;
        $total_calories = array_reduce($ingredients->toArray(), function($i, $obj){
            return $i += $obj['carbohydrates']*$obj['pivot']['amount']/100;
        });

        return round($total_calories);
    }

    public function week_meals()
    {
        return $this->hasMany(WeekMeal::class);
    }

    public function meal_type()
    {
        return $this->belongsTo(MealType::class);
    }

    public function scopeNotCustom($builder)
    {
        return $builder->where('custom', 0);
    }

    public function scopeCustom($q, $meal_type_id = null, $kitchen_id = null)
    {
        $q->whereCustom(1);
        if($meal_type_id) {
            $q->whereMealTypeId($meal_type_id);
        }
        if($kitchen_id) {
            $q->whereKitchenId($kitchen_id);
        }

        return $q;
    }

    public function plans() {
        return $this->belongsToMany(Plan::class, 'plan_meals')->withTimestamps();
    }

}
