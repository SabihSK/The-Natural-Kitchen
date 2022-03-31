<?php

use Illuminate\Database\Seeder;

class CustomDataTypesTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        \DB::table('data_types')->insert(array (
            3 => 
            array (
                'id' => 4,
                'name' => 'ingredients',
                'slug' => 'ingredients',
                'display_name_singular' => 'Ingredient',
                'display_name_plural' => 'Ingredients',
                'icon' => NULL,
                'model_name' => 'App\\Ingredient',
                'policy_name' => NULL,
                'controller' => NULL,
                'description' => NULL,
                'generate_permissions' => 1,
                'server_side' => 0,
                'details' => '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}',
                'created_at' => '2019-01-09 12:14:49',
                'updated_at' => '2019-01-09 12:14:49',
            ),
            4 => 
            array (
                'id' => 5,
                'name' => 'kitchens',
                'slug' => 'kitchens',
                'display_name_singular' => 'Kitchen',
                'display_name_plural' => 'Kitchens',
                'icon' => NULL,
                'model_name' => 'App\\Kitchen',
                'policy_name' => NULL,
                'controller' => NULL,
                'description' => NULL,
                'generate_permissions' => 1,
                'server_side' => 0,
                'details' => '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}',
                'created_at' => '2019-01-09 12:16:46',
                'updated_at' => '2019-01-09 12:16:46',
            ),
            5 => 
            array (
                'id' => 6,
                'name' => 'meals',
                'slug' => 'meals',
                'display_name_singular' => 'Meal',
                'display_name_plural' => 'Meals',
                'icon' => NULL,
                'model_name' => 'App\\Meal',
                'policy_name' => NULL,
                'controller' => NULL,
                'description' => NULL,
                'generate_permissions' => 1,
                'server_side' => 0,
                'details' => '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}',
                'created_at' => '2019-01-09 12:17:08',
                'updated_at' => '2019-01-09 12:18:33',
            ),
            6 => 
            array (
                'id' => 7,
                'name' => 'weeks',
                'slug' => 'weeks',
                'display_name_singular' => 'Week',
                'display_name_plural' => 'Weeks',
                'icon' => NULL,
                'model_name' => 'App\\Week',
                'policy_name' => NULL,
                'controller' => NULL,
                'description' => NULL,
                'generate_permissions' => 1,
                'server_side' => 0,
                'details' => '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}',
                'created_at' => '2019-01-09 12:19:29',
                'updated_at' => '2019-01-09 12:19:29',
            ),
            7 => 
            array (
                'id' => 8,
                'name' => 'plans',
                'slug' => 'plans',
                'display_name_singular' => 'Plan',
                'display_name_plural' => 'Plans',
                'icon' => NULL,
                'model_name' => 'App\\Plan',
                'policy_name' => NULL,
                'controller' => NULL,
                'description' => NULL,
                'generate_permissions' => 1,
                'server_side' => 0,
                'details' => '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}',
                'created_at' => '2019-01-09 12:19:41',
                'updated_at' => '2019-01-09 12:19:41',
            ),
            8 => 
            array (
                'id' => 9,
                'name' => 'meal_category',
                'slug' => 'meal-category',
                'display_name_singular' => 'Meal Category',
                'display_name_plural' => 'Meal Categories',
                'icon' => NULL,
                'model_name' => 'App\\MealCategory',
                'policy_name' => NULL,
                'controller' => NULL,
                'description' => NULL,
                'generate_permissions' => 1,
                'server_side' => 0,
                'details' => '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}',
                'created_at' => '2019-01-09 12:19:57',
                'updated_at' => '2019-01-09 12:19:57',
            ),
            9 => 
            array (
                'id' => 10,
                'name' => 'customers',
                'slug' => 'customers',
                'display_name_singular' => 'Customer',
                'display_name_plural' => 'Customers',
                'icon' => NULL,
                'model_name' => 'App\\Customer',
                'policy_name' => NULL,
                'controller' => NULL,
                'description' => NULL,
                'generate_permissions' => 1,
                'server_side' => 0,
                'details' => '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}',
                'created_at' => '2019-01-09 12:34:55',
                'updated_at' => '2019-01-10 05:22:22',
            ),
            10 => 
            array (
                'id' => 11,
                'name' => 'meal_categories',
                'slug' => 'meal-categories',
                'display_name_singular' => 'Meal Category',
                'display_name_plural' => 'Meal Categories',
                'icon' => NULL,
                'model_name' => 'App\\MealCategory',
                'policy_name' => NULL,
                'controller' => NULL,
                'description' => NULL,
                'generate_permissions' => 1,
                'server_side' => 0,
                'details' => '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}',
                'created_at' => '2019-01-09 13:11:33',
                'updated_at' => '2019-01-09 13:11:33',
            ),
        ));
        
        
    }
}