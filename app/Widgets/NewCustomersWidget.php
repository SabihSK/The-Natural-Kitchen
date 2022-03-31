<?php

namespace App\Widgets;

use App\Customer;
use App\Meal;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Widgets\BaseDimmer;

class NewCustomersWidget extends BaseDimmer
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
        $date = new Carbon(); //  DateTime string will be 2014-04-03 13:57:34

        $date->subWeek(); // or $date->subDays(7),  2014-03-27 13:58:25

        $customers = Customer::where('created_at', '>', $date->toDateTimeString() )->get();


        $count = $customers->count();

        $string = trans_choice('voyager::dimmer.customer', $count);

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-news',
            'title'  => "{$count} Customers",
            'text'   => $count . ' newly added customers',
            'button' => [
                'text' => 'View all customers',
                'link' => route('voyager.customers.index'),
            ],
            'image' => '/storage/'. setting('widgets.customers_widget_image'),
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
