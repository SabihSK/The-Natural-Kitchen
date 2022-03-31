<?php

namespace App\Providers;

use App\Customer;
use App\User;
use App\CustomerExcludedDay;
use App\Meal;
use App\Observers\MealObserver;
use App\Observers\CustomerExcludedDayObserver;
use App\Observers\CustomerObserver;
use App\Observers\WeekObserver;
use App\Observers\UserObserver;
use App\Week;
use Illuminate\Support\ServiceProvider;
use TCG\Voyager\Facades\Voyager;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        header('Access-Control-Allow-Origin: *');

        Customer::observe(CustomerObserver::class);
        Week::observe(WeekObserver::class);
        CustomerExcludedDay::observe(CustomerExcludedDayObserver::class);
        Voyager::addAction(\App\Actions\Duplicate::class);

        Meal::observe(MealObserver::class);
        User::observe(UserObserver::class);
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        if ($this->app->environment() == 'local') {
            $this->app->register('Laracasts\Generators\GeneratorsServiceProvider');
            $this->app->register('Orangehill\Iseed\IseedServiceProvider');
        }
    }
}
