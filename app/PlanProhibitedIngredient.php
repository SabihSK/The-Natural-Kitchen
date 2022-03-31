<?php

namespace App;

use Illuminate\Database\Eloquent\Relations\Pivot;

class PlanProhibitedIngredient extends Pivot
{
    protected $table = 'plan_prohibited_ingredients';
}
