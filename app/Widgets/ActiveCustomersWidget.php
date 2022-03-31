<?php

namespace App\Widgets;

use App\Customer;
use App\Meal;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Widgets\BaseDimmer;

class ActiveCustomersWidget extends BaseDimmer
{
    /**
     * The configuration array.
     *
     * @var array
     */
    protected $config = [];

    /**
     * Treat this method as a controller action.
     * Return view() or other content to display.
     */
    public function run()
    {
        $all_customers  = Customer::all();
        $all_count = $all_customers->count();

        $active_customers = Customer::active()->get()->count();

        $new_customers_count = Customer::newlyAdded()->count();

        $newlyAdded_customers = Customer::newlyAdded()->count();

        $count_str = $new_customers_count == 1 ? 'customer' : 'Customers';

        $string = trans_choice('voyager::dimmer.customer', $active_customers);

        return view('voyager::active-customers-dimmer', array_merge($this->config, [
            'icon'   => 'voyager-people',
            'title'  => "{$all_count} Customers",
            'text'   => $active_customers . ' Active customers out of '.$all_count.' total customers'."<br>
                        <span style='font-weight: 900'>{$new_customers_count} newly added ".$count_str."</span> ",
            'button' => [
                'text' => 'View all customers',
                'link' => route('voyager.customers.index'),
            ],
            'image' => '/storage/'. setting('widgets.customers_widget_image'),
            'all_count' => $all_count,
            'active_customers' => $active_customers,
            'newlyAdded_customers' => $newlyAdded_customers,
        ]));
    }

    /**
     * Determine if the widget should be displayed.
     *
     * @return bool
     */
    public function shouldBeDisplayed()
    {
        return Auth::user()->can('browse', new Customer());
    }

}
