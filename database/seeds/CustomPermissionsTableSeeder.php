<?php

use Illuminate\Database\Seeder;

class CustomPermissionsTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        \DB::table('permissions')->insert(array (
            26 => 
            array (
                'id' => 27,
                'key' => 'browse_ingredients',
                'table_name' => 'ingredients',
                'created_at' => '2019-01-09 12:14:50',
                'updated_at' => '2019-01-09 12:14:50',
            ),
            27 => 
            array (
                'id' => 28,
                'key' => 'read_ingredients',
                'table_name' => 'ingredients',
                'created_at' => '2019-01-09 12:14:50',
                'updated_at' => '2019-01-09 12:14:50',
            ),
            28 => 
            array (
                'id' => 29,
                'key' => 'edit_ingredients',
                'table_name' => 'ingredients',
                'created_at' => '2019-01-09 12:14:50',
                'updated_at' => '2019-01-09 12:14:50',
            ),
            29 => 
            array (
                'id' => 30,
                'key' => 'add_ingredients',
                'table_name' => 'ingredients',
                'created_at' => '2019-01-09 12:14:50',
                'updated_at' => '2019-01-09 12:14:50',
            ),
            30 => 
            array (
                'id' => 31,
                'key' => 'delete_ingredients',
                'table_name' => 'ingredients',
                'created_at' => '2019-01-09 12:14:50',
                'updated_at' => '2019-01-09 12:14:50',
            ),
            31 => 
            array (
                'id' => 32,
                'key' => 'browse_kitchens',
                'table_name' => 'kitchens',
                'created_at' => '2019-01-09 12:16:46',
                'updated_at' => '2019-01-09 12:16:46',
            ),
            32 => 
            array (
                'id' => 33,
                'key' => 'read_kitchens',
                'table_name' => 'kitchens',
                'created_at' => '2019-01-09 12:16:46',
                'updated_at' => '2019-01-09 12:16:46',
            ),
            33 => 
            array (
                'id' => 34,
                'key' => 'edit_kitchens',
                'table_name' => 'kitchens',
                'created_at' => '2019-01-09 12:16:46',
                'updated_at' => '2019-01-09 12:16:46',
            ),
            34 => 
            array (
                'id' => 35,
                'key' => 'add_kitchens',
                'table_name' => 'kitchens',
                'created_at' => '2019-01-09 12:16:46',
                'updated_at' => '2019-01-09 12:16:46',
            ),
            35 => 
            array (
                'id' => 36,
                'key' => 'delete_kitchens',
                'table_name' => 'kitchens',
                'created_at' => '2019-01-09 12:16:46',
                'updated_at' => '2019-01-09 12:16:46',
            ),
            36 => 
            array (
                'id' => 37,
                'key' => 'browse_meals',
                'table_name' => 'meals',
                'created_at' => '2019-01-09 12:17:08',
                'updated_at' => '2019-01-09 12:17:08',
            ),
            37 => 
            array (
                'id' => 38,
                'key' => 'read_meals',
                'table_name' => 'meals',
                'created_at' => '2019-01-09 12:17:08',
                'updated_at' => '2019-01-09 12:17:08',
            ),
            38 => 
            array (
                'id' => 39,
                'key' => 'edit_meals',
                'table_name' => 'meals',
                'created_at' => '2019-01-09 12:17:08',
                'updated_at' => '2019-01-09 12:17:08',
            ),
            39 => 
            array (
                'id' => 40,
                'key' => 'add_meals',
                'table_name' => 'meals',
                'created_at' => '2019-01-09 12:17:08',
                'updated_at' => '2019-01-09 12:17:08',
            ),
            40 => 
            array (
                'id' => 41,
                'key' => 'delete_meals',
                'table_name' => 'meals',
                'created_at' => '2019-01-09 12:17:08',
                'updated_at' => '2019-01-09 12:17:08',
            ),
            41 => 
            array (
                'id' => 42,
                'key' => 'browse_weeks',
                'table_name' => 'weeks',
                'created_at' => '2019-01-09 12:19:29',
                'updated_at' => '2019-01-09 12:19:29',
            ),
            42 => 
            array (
                'id' => 43,
                'key' => 'read_weeks',
                'table_name' => 'weeks',
                'created_at' => '2019-01-09 12:19:29',
                'updated_at' => '2019-01-09 12:19:29',
            ),
            43 => 
            array (
                'id' => 44,
                'key' => 'edit_weeks',
                'table_name' => 'weeks',
                'created_at' => '2019-01-09 12:19:29',
                'updated_at' => '2019-01-09 12:19:29',
            ),
            44 => 
            array (
                'id' => 45,
                'key' => 'add_weeks',
                'table_name' => 'weeks',
                'created_at' => '2019-01-09 12:19:29',
                'updated_at' => '2019-01-09 12:19:29',
            ),
            45 => 
            array (
                'id' => 46,
                'key' => 'delete_weeks',
                'table_name' => 'weeks',
                'created_at' => '2019-01-09 12:19:29',
                'updated_at' => '2019-01-09 12:19:29',
            ),
            46 => 
            array (
                'id' => 47,
                'key' => 'browse_plans',
                'table_name' => 'plans',
                'created_at' => '2019-01-09 12:19:41',
                'updated_at' => '2019-01-09 12:19:41',
            ),
            47 => 
            array (
                'id' => 48,
                'key' => 'read_plans',
                'table_name' => 'plans',
                'created_at' => '2019-01-09 12:19:41',
                'updated_at' => '2019-01-09 12:19:41',
            ),
            48 => 
            array (
                'id' => 49,
                'key' => 'edit_plans',
                'table_name' => 'plans',
                'created_at' => '2019-01-09 12:19:41',
                'updated_at' => '2019-01-09 12:19:41',
            ),
            49 => 
            array (
                'id' => 50,
                'key' => 'add_plans',
                'table_name' => 'plans',
                'created_at' => '2019-01-09 12:19:41',
                'updated_at' => '2019-01-09 12:19:41',
            ),
            50 => 
            array (
                'id' => 51,
                'key' => 'delete_plans',
                'table_name' => 'plans',
                'created_at' => '2019-01-09 12:19:41',
                'updated_at' => '2019-01-09 12:19:41',
            ),
            51 => 
            array (
                'id' => 52,
                'key' => 'browse_meal_category',
                'table_name' => 'meal_category',
                'created_at' => '2019-01-09 12:19:57',
                'updated_at' => '2019-01-09 12:19:57',
            ),
            52 => 
            array (
                'id' => 53,
                'key' => 'read_meal_category',
                'table_name' => 'meal_category',
                'created_at' => '2019-01-09 12:19:57',
                'updated_at' => '2019-01-09 12:19:57',
            ),
            53 => 
            array (
                'id' => 54,
                'key' => 'edit_meal_category',
                'table_name' => 'meal_category',
                'created_at' => '2019-01-09 12:19:57',
                'updated_at' => '2019-01-09 12:19:57',
            ),
            54 => 
            array (
                'id' => 55,
                'key' => 'add_meal_category',
                'table_name' => 'meal_category',
                'created_at' => '2019-01-09 12:19:57',
                'updated_at' => '2019-01-09 12:19:57',
            ),
            55 => 
            array (
                'id' => 56,
                'key' => 'delete_meal_category',
                'table_name' => 'meal_category',
                'created_at' => '2019-01-09 12:19:57',
                'updated_at' => '2019-01-09 12:19:57',
            ),
            56 => 
            array (
                'id' => 57,
                'key' => 'browse_customers',
                'table_name' => 'customers',
                'created_at' => '2019-01-09 12:34:55',
                'updated_at' => '2019-01-09 12:34:55',
            ),
            57 => 
            array (
                'id' => 58,
                'key' => 'read_customers',
                'table_name' => 'customers',
                'created_at' => '2019-01-09 12:34:55',
                'updated_at' => '2019-01-09 12:34:55',
            ),
            58 => 
            array (
                'id' => 59,
                'key' => 'edit_customers',
                'table_name' => 'customers',
                'created_at' => '2019-01-09 12:34:55',
                'updated_at' => '2019-01-09 12:34:55',
            ),
            59 => 
            array (
                'id' => 60,
                'key' => 'add_customers',
                'table_name' => 'customers',
                'created_at' => '2019-01-09 12:34:55',
                'updated_at' => '2019-01-09 12:34:55',
            ),
            60 => 
            array (
                'id' => 61,
                'key' => 'delete_customers',
                'table_name' => 'customers',
                'created_at' => '2019-01-09 12:34:55',
                'updated_at' => '2019-01-09 12:34:55',
            ),
            61 => 
            array (
                'id' => 62,
                'key' => 'browse_meal_categories',
                'table_name' => 'meal_categories',
                'created_at' => '2019-01-09 13:11:33',
                'updated_at' => '2019-01-09 13:11:33',
            ),
            62 => 
            array (
                'id' => 63,
                'key' => 'read_meal_categories',
                'table_name' => 'meal_categories',
                'created_at' => '2019-01-09 13:11:33',
                'updated_at' => '2019-01-09 13:11:33',
            ),
            63 => 
            array (
                'id' => 64,
                'key' => 'edit_meal_categories',
                'table_name' => 'meal_categories',
                'created_at' => '2019-01-09 13:11:33',
                'updated_at' => '2019-01-09 13:11:33',
            ),
            64 => 
            array (
                'id' => 65,
                'key' => 'add_meal_categories',
                'table_name' => 'meal_categories',
                'created_at' => '2019-01-09 13:11:33',
                'updated_at' => '2019-01-09 13:11:33',
            ),
            65 => 
            array (
                'id' => 66,
                'key' => 'delete_meal_categories',
                'table_name' => 'meal_categories',
                'created_at' => '2019-01-09 13:11:33',
                'updated_at' => '2019-01-09 13:11:33',
            ),
        ));
        
        
    }
}