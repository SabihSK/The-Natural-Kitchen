<?php

namespace App\Widgets;

use App\Customer;
use Arrilot\Widgets\AbstractWidget;
use Carbon\Carbon;
use TCG\Voyager\Widgets\BaseDimmer;

class ExpiringCustomers extends BaseDimmer
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
        $customers = Customer::active()->havingWeeks()->with(['weeks' => function($q){
            $q->orderByDesc('enddate');
        }])->get();

        $customers->each(function(&$c){
            $date = Carbon::parse($c->weeks->first()->enddate);
            $now = Carbon::now();

            $c->near = $date->diffInDays($now) < 10 ? 1 : 0;
        });

        return view('widgets.expiring_customers', [
            'customers' => $customers,
            'config' => $this->config,
        ]);
    }
}
