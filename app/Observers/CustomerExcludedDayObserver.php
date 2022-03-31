<?php

namespace App\Observers;

use App\CustomerExcludedDay;
use App\CustomerMeal;
use App\WeekMeal;
use Illuminate\Support\Facades\Log;

class CustomerExcludedDayObserver
{
    public function created(CustomerExcludedDay $date_obj)
    {
        Log::info("Observing the below created paused day object");
        Log::info($date_obj);

        $existing_week_meal = WeekMeal::where('date', $date_obj->date)->get();

        if ($existing_week_meal->count() > 0) {
            $existing_week_meal->each(function (&$wm) use($date_obj) {

                Log::info("Week Meals exists");
                Log::info($wm);

                $customer_meals = CustomerMeal::where(['week_meal_id' => $wm->id, 'customer_id' => $date_obj->customer_id])->get();
                Log::info('$customer_meals');
                Log::info($customer_meals);

                if ($customer_meals) {
                    $customer_meals->each(function (&$cm) {
                        Log::info('$cm');
                        Log::info($cm);
                        if ($cm->cooked == 0) {
                            Log::info('deleting the following $cm: ');
                            Log::info($cm);
                            $cm->delete();
                        }
                    });
                }
            });
        }
    }
}
