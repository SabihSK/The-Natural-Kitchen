<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CustomerProgram extends Model
{
    protected $guarded = [];

    protected $casts = [
        'options' => 'array'
    ];

    public function mealType()
    {
        return $this->belongsTo(MealType::class);
    }

    public function customer()
    {
        return $this->belongsTo(Customer::class);
    }

    public function getOptionsAttribute()
    {
        return json_decode($this->attributes['options']);
    }
}
