<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\Pivot;

class CustomSubscription extends Pivot
{
    protected $table = 'custom_subscription';

    protected $guarded = [];
	

	
/**
 * Get a new query builder for the model's table.
 *
 * @param bool $ordered
 * @return \Illuminate\Database\Eloquent\Builder
 */
public function newQuery($ordered = true)
{
    $query = parent::newQuery();    

    if (empty($ordered)) {
        return $query;
    }    

    return $query->orderBy('created_at', $this->orderDirection);
}	
	
}
