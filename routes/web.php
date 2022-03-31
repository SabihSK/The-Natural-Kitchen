<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/



$router = new \Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/test/{asd}', function ($asd) {
    dd(auth()->user()->role->name != 'admin');
});

Route::group(['prefix' => 'admin'], function ($router) {

    Voyager::routes();
//    $router->group(['middleware' => 'admin.user'], function ($router) {

    Route::get('/populate-calories', function(){
        \App\Customer::all()->each(function ($c){
             $c->daily_calories = $c->calculateCalories();
             $c->save();
        });

        return 'calories population Done!';
    });

    Route::get('/plan-meal-link', function(){
        \App\Meal::all()->each(function ($m){
            $plans_ids = \App\Plan::inRandomOrder()
                ->get()->take(rand(1,5))->pluck('id')->toArray();
            $m->plans()->attach($plans_ids);
        });

        return 'plan meal links Done!';
    });

    $router->get('/customers_week_meals', 'CustomerMealController@index')->name('customers_week_meals');
    $router->get('/meals/{meal_id}/ingredients', 'MealController@getIngredients')->name('meal_ingredients');
    $router->get('/all_ingredients', 'MealController@getAllIngredients')->name('all_ingredients');
    $router->get('/all_ingredients_with_types', 'IngredientTypeController@allWithIngredients')->name('all_ingredients_with_types');
    $router->post('/update_ingredients', 'MealController@updateMealIngredients')->name('update_ingredients');
    $router->get('/plans/{plan_id}/prohibited_ingredients', 'PlanController@getProhibitedIngredients')->name('plan_prohibited_ingredients');
    $router->post('/update_plan_prohibited_ingredients', 'PlanController@updatePlanProhibitedIngredients')->name('update_plan_prohibited_ingredients');
    $router->get('/customers/{customer_id}/customer_allergic_ingredients', 'CustomerController@getAllergicIngredients')->name('customer_allergic_ingredients');
    $router->post('/update_customer_allergic_ingredients', 'CustomerController@updatePlanAllergicIngredients')->name('update_customer_allergic_ingredients');
    $router->get('/customer/{customer_id}/valid_meals/{meal_type_id}', 'CustomerController@getValidMeals')->name('customer_valid_meals');
    $router->get('/weeks/{week_id}/get', 'WeekController@getWeekDays')->name('get_week');
    $router->get('/all_meals_types/{without_relation?}', 'MealTypeController@getAllMealTypes')->name('all_meals_types');
    $router->get('/all_meals', 'MealController@all')->name('all_meals');
    $router->get('/filtered_meals_list/meal_type/{meal_type_id}/plan/{plan_id}', 'MealController@filteredList')->name('filtered_meals_list');
    $router->get('/all_plans', 'PlanController@all')->name('all_plans');
    $router->get('/week_meals/{week_id}/{day}/meals/{meal_type_id?}', 'WeekMealController@getWeekDayMeals')->name('get_week_day_meals');
    $router->get('/meals_list/{week_id}/{day}/meals/{meal_type_id?}', 'WeekMealController@getWeekDayMealsList')->name('get_week_day_meals_by_meal_type');
    $router->get('/meal_types/all', 'MealTypeController@all')->name('all_meal_types_only');
    $router->post('/add_week_meal', 'WeekController@addMeal')->name('add_week_meal');
    $router->post('/remove_week_meal', 'WeekController@removeMeal')->name('remove_week_meal');
    $router->get('/all_weeks', 'WeekController@getAllWeeks')->name('all_weeks');
    $router->get('/all_customers', 'CustomerController@getAllCustomers')->name('all_customers');
    $router->post('/set_customers_meals/{week_id}', 'CustomerMealController@setWeekMeals')->name('set_customers_meals');
    $router->get('/get_customers_meals/{week_id}', 'CustomerMealController@getWeekMeals')->name('get_customers_meals');
    $router->get('/customers_meals/get_missing_meals/{week_id}', 'CustomerMealController@getMissingWeekMeals')->name('get_missing_customer_meals');
    $router->get('/customer/{customer_id}/week_meals/{week_id}', 'CustomerMealController@getCustomerWeekMeals')->name('get_customer_week_meals');
    $router->get('/customer-missing-meal/{customer_id}/{week_id}/{day}/{meal_type_id}', 'CustomerMealController@missingMealReason')->name('customer_missing_meal');
    $router->get('/week_meals_count/{week_id}', 'WeekMealController@getWeekMealCount')->name('week_meals_count');
    $router->post('/week_meals/bulk-add', 'WeekMealController@bulkAdd')->name('bulk_add_week_meals');
    $router->get('/all_customers_lite', 'CustomerController@simple')->name('customers_simple_format');
    $router->get('/customer_meal/{customer_meal_id}/ingredients', 'CustomerMealController@allIngredients')->name('customer_meal_ingredients');
    $router->get('/day_meals/{week_id}/{date}/meals/{meal_type_id}', 'MealController@mealTypeDayMeals')->name('meal_type_day_meals');
    $router->post('/save_additional_ingredients', 'CustomerMealController@saveAdditionalIngredients')->name('save_additional_ingredients');

    $router->get('/meals-calendar/{kitchen_id}', 'CustomerMealController@getCalendar')->name('meals_calendar');
    $router->get('/meal-duplicate/{id}', 'MealController@duplicate')->name('duplicate-meal');

    $router->get('/duration_week_meals/{kitchen_id}/{start_date}/{end_date}', 'WeekMealController@durationMeals')->name('duration_meals');
    $router->get('/customers/{customer_id}/customer_disliked_ingredients', 'CustomerController@getDislikedIngredients')->name('customer_disliked_ingredients');
    $router->post('/update_customer_disliked_ingredients', 'CustomerController@updateDislikedIngredients')->name('update_customer_disliked_ingredients');

    $router->get('/ingredient_types/all', 'IngredientTypeController@allIngredientTypes')->name('all_ingredient_types');
    $router->get('/all_ingredients_grouped', 'IngredientController@allIngredients')->name('all_ingredients_grouped');
    $router->get('/customer/{customer_id}/ingredient_types', 'CustomerController@getIngredientTypes')->name('customer_ingredient_types');
    $router->post('/update_customer_ingredient_types_amounts', 'CustomerController@updateIngredientTypesAmounts')->name('update_customer_ingredient_types_amounts');
    $router->delete('/customer_meal/{id}/delete', 'CustomerMealController@delete')->name('delete_customer_meal');
    $router->post('/customer_meal/prepare', 'CustomerMealController@setMealPreparation')->name('prepare_meal');
    $router->post('/customer_meal/bulk_prepare', 'CustomerMealController@bulkPrepareMeals')->name('bulk_prepare_meal');
    $router->get('/customer_meal/{id}/print-label', 'CustomerMealController@printLabel')->name('customer_meal_label');
    $router->get('/customer_meal/{id}/print-data', 'CustomerMealController@printData')->name('customer_meal_data');
    $router->get('/customers_meals_list/{date?}', 'CustomerMealController@customersMealsForDate')->name('customers_meals_list');
    $router->get('/customers-meals-report/{date?}', 'CustomerMealController@CustomersMealsReport')->name('customers_meals_report');

    $router->get('customer/{id}/program', 'CustomerProgramController@getCustomerProgram')->name('get_customer_program');

    $router->post('customer/add_program_option', 'CustomerProgramController@addOption')->name('add_program_option');

    $router->get('customer/{id}/mealtypes', 'CustomerController@getMealTypes')->name('customer.mealtypes');

    $router->get('customer/{id}', 'CustomerController@show')->name('customer.get');
    $router->post('customer-update/{id}', 'CustomerController@update')->name('customer.update');

    $router->post('customer-mealtypes/add', 'CustomerController@addMealType')->name('customer.mealtype.add');

    $router->post('/customer-program-meals', 'MealController@getOptionMatchingMeals')->name('customer.program.meals');

    $router->get('/customer/{id}/subscriptions/{subscribed}', 'CustomerSubscriptionController@getWeeksSubscriptions')->name('customer.subscriptions');

    $router->get('/customcustomer/{id}/subscriptions/{subscribed}', 'CustomerSubscriptionController@getCustomSubscription')->name('customer.custom.subscriptions');

///   Custom Route By PK

	$router->get('/customsubscriptionsall', 'CustomerSubscriptionController@getCustomSubscriptionall')->name('customer.custom.subscriptions.all');


	$router->get('/allergicsall', 'CustomerController@getAllergicIngredientsall')->name('customer.custom.getallergicingredientsall');


    $router->post('/customer/subscriptions', 'CustomerSubscriptionController@addWeekSubscription')->name('customer.subscriptions.update');

   $router->post('/customer/customsubscriptions', 'CustomerSubscriptionController@addCustomSubscription')->name('customer.custom.subscriptions.update');

    $router->get('/customer/{id}/excluded-days/{added}', 'CustomerSubscriptionController@getExcludedDays')->name('customer.excluded-days');
    $router->post('/customer/excluded-days', 'CustomerSubscriptionController@addExcludedDays')->name('customer.excluded-days.update');
    $router->post('/customer/paused-days', 'CustomerSubscriptionController@updatePausedDays')->name('customer.paused-days.update');

    $router->get('/generate-missing-ids', function (){
        $generated = \App\Customer::whereNull('customer_id')->each(function ($c){
            $c->touch();
        });
        if($generated) {
            return redirect()->route('voyager.customers.index');
        }
    })->name('generate-missing-ids');

    //    });

});
