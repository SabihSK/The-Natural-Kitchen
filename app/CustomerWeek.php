<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\Pivot;

class CustomerWeek extends Pivot
{
    protected $table = 'customer_weeks';

    protected $guarded = [];
}
