<?php

namespace App\Observers;

use App\Customer;

class WeekObserver
{
    public function created($week)
    {
        $customers = Customer::paused();

        $week->customers()->attach($customers->pluck('id'), ['subscribed' => 0]);
    }
}
