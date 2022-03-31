<?php

namespace App;

use App\Observers\MealTypeObserver;
use Illuminate\Database\Eloquent\Model;

class MealType extends Model
{
    protected $guarded = [];

    /*protected static function boot()
    {
        parent::boot();
        static::observe(MealTypeObserver::class);
    }*/

    public function meals() {
        return $this->hasMany(Meal::class);
    }

    public function scopeMain($query)
    {
        return $query->whereExtra(0);
    }

    public function scopeExtra($query)
    {
        return $query->whereExtra(1);
    }
}
