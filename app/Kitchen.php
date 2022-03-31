<?php

namespace App;

use App\Observers\KitchenObserver;
use Illuminate\Database\Eloquent\Model;

class Kitchen extends Model
{
    public static function boot()
    {
        parent::boot();
        self::observe(KitchenObserver::class);
    }
}
