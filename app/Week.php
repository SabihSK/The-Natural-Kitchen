<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class Week extends Model
{
    protected $appends = ['days'];

    protected $dates = ['startdate', 'enddate'];

    public function getDaysAttribute()
    {
        $dates = [];

        for ($date = Carbon::parse($this->startdate); $date->lte(Carbon::parse($this->enddate)); $date->addDay()) {
            $dates[] = $date->format('d-m-Y');
        }

        return $dates;
    }

    public function meal()
    {
        return $this->belongsToMany(Meal::class, 'week_meals')->withPivot(['meal_type_id', 'date'])->withTimestamps();
    }

    public function meals()
    {
        return $this->belongsToMany(Meal::class, 'week_meals')->withPivot(['meal_type_id', 'date'])->withTimestamps();
    }

    public function customers()
    {
        return $this->belongsToMany(Customer::class, 'customer_weeks')->withTimestamps();
    }
}
