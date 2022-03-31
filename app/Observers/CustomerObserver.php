<?php

namespace App\Observers;

use App\Customer;
use Illuminate\Support\Facades\Log;

class CustomerObserver
{
    public function created(Customer $customer)
    {
        $customer_id = $customer->customer_id;

        if (empty($customer_id) || is_null($customer_id)) {
            $customer->generateCId();
        }
        if($customer->consider_calories == 1 && $customer->daily_calories == 0) {
            Log::info("Re-calculating calories for {$customer->fullname} #{$customer->id}");
            $customer->reCalculateCalories();
        }
    }

    public function updating(Customer $customer)
    {
        Log::info("Updating customer =>  {$customer->fullname} #{$customer->id}");

        if ($customer->isDirty('height') || $customer->isDirty('weight') || $customer->isDirty('age')) {
            $customer->reCalculateCalories();
        }

        if($customer->consider_calories == 1 && $customer->daily_calories == 0 && !$customer->isDirty('daily_calories')) {
            Log::info("Re-calculating calories for {$customer->fullname} #{$customer->id}");
            $customer->reCalculateCalories();
        }

        $customer_id = $customer->customer_id;

        if (empty($customer_id) || is_null($customer_id)) {
            $customer->generateCId();
        }
    }
}
