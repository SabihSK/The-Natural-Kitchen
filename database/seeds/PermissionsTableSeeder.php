<?php

use Illuminate\Database\Seeder;

class PermissionsTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('permissions')->delete();
        
        \DB::table('permissions')->insert(array (
            0 => 
            array (
                'id' => 1,
                'key' => 'browse_admin',
                'table_name' => NULL,
                'created_at' => '2019-01-10 07:25:28',
                'updated_at' => '2019-01-10 07:25:28',
            ),
            1 => 
            array (
                'id' => 2,
                'key' => 'browse_bread',
                'table_name' => NULL,
                'created_at' => '2019-01-10 07:25:28',
                'updated_at' => '2019-01-10 07:25:28',
            ),
            2 => 
            array (
                'id' => 3,
                'key' => 'browse_database',
                'table_name' => NULL,
                'created_at' => '2019-01-10 07:25:28',
                'updated_at' => '2019-01-10 07:25:28',
            ),
            3 => 
            array (
                'id' => 4,
                'key' => 'browse_media',
                'table_name' => NULL,
                'created_at' => '2019-01-10 07:25:28',
                'updated_at' => '2019-01-10 07:25:28',
            ),
            4 => 
            array (
                'id' => 5,
                'key' => 'browse_compass',
                'table_name' => NULL,
                'created_at' => '2019-01-10 07:25:28',
                'updated_at' => '2019-01-10 07:25:28',
            ),
            5 => 
            array (
                'id' => 6,
                'key' => 'browse_menus',
                'table_name' => 'menus',
                'created_at' => '2019-01-10 07:25:28',
                'updated_at' => '2019-01-10 07:25:28',
            ),
            6 => 
            array (
                'id' => 7,
                'key' => 'read_menus',
                'table_name' => 'menus',
                'created_at' => '2019-01-10 07:25:28',
                'updated_at' => '2019-01-10 07:25:28',
            ),
            7 => 
            array (
                'id' => 8,
                'key' => 'edit_menus',
                'table_name' => 'menus',
                'created_at' => '2019-01-10 07:25:28',
                'updated_at' => '2019-01-10 07:25:28',
            ),
            8 => 
            array (
                'id' => 9,
                'key' => 'add_menus',
                'table_name' => 'menus',
                'created_at' => '2019-01-10 07:25:28',
                'updated_at' => '2019-01-10 07:25:28',
            ),
            9 => 
            array (
                'id' => 10,
                'key' => 'delete_menus',
                'table_name' => 'menus',
                'created_at' => '2019-01-10 07:25:28',
                'updated_at' => '2019-01-10 07:25:28',
            ),
            10 => 
            array (
                'id' => 11,
                'key' => 'browse_roles',
                'table_name' => 'roles',
                'created_at' => '2019-01-10 07:25:28',
                'updated_at' => '2019-01-10 07:25:28',
            ),
            11 => 
            array (
                'id' => 12,
                'key' => 'read_roles',
                'table_name' => 'roles',
                'created_at' => '2019-01-10 07:25:28',
                'updated_at' => '2019-01-10 07:25:28',
            ),
            12 => 
            array (
                'id' => 13,
                'key' => 'edit_roles',
                'table_name' => 'roles',
                'created_at' => '2019-01-10 07:25:28',
                'updated_at' => '2019-01-10 07:25:28',
            ),
            13 => 
            array (
                'id' => 14,
                'key' => 'add_roles',
                'table_name' => 'roles',
                'created_at' => '2019-01-10 07:25:28',
                'updated_at' => '2019-01-10 07:25:28',
            ),
            14 => 
            array (
                'id' => 15,
                'key' => 'delete_roles',
                'table_name' => 'roles',
                'created_at' => '2019-01-10 07:25:28',
                'updated_at' => '2019-01-10 07:25:28',
            ),
            15 => 
            array (
                'id' => 16,
                'key' => 'browse_users',
                'table_name' => 'users',
                'created_at' => '2019-01-10 07:25:28',
                'updated_at' => '2019-01-10 07:25:28',
            ),
            16 => 
            array (
                'id' => 17,
                'key' => 'read_users',
                'table_name' => 'users',
                'created_at' => '2019-01-10 07:25:28',
                'updated_at' => '2019-01-10 07:25:28',
            ),
            17 => 
            array (
                'id' => 18,
                'key' => 'edit_users',
                'table_name' => 'users',
                'created_at' => '2019-01-10 07:25:28',
                'updated_at' => '2019-01-10 07:25:28',
            ),
            18 => 
            array (
                'id' => 19,
                'key' => 'add_users',
                'table_name' => 'users',
                'created_at' => '2019-01-10 07:25:28',
                'updated_at' => '2019-01-10 07:25:28',
            ),
            19 => 
            array (
                'id' => 20,
                'key' => 'delete_users',
                'table_name' => 'users',
                'created_at' => '2019-01-10 07:25:28',
                'updated_at' => '2019-01-10 07:25:28',
            ),
            20 => 
            array (
                'id' => 21,
                'key' => 'browse_settings',
                'table_name' => 'settings',
                'created_at' => '2019-01-10 07:25:28',
                'updated_at' => '2019-01-10 07:25:28',
            ),
            21 => 
            array (
                'id' => 22,
                'key' => 'read_settings',
                'table_name' => 'settings',
                'created_at' => '2019-01-10 07:25:28',
                'updated_at' => '2019-01-10 07:25:28',
            ),
            22 => 
            array (
                'id' => 23,
                'key' => 'edit_settings',
                'table_name' => 'settings',
                'created_at' => '2019-01-10 07:25:28',
                'updated_at' => '2019-01-10 07:25:28',
            ),
            23 => 
            array (
                'id' => 24,
                'key' => 'add_settings',
                'table_name' => 'settings',
                'created_at' => '2019-01-10 07:25:28',
                'updated_at' => '2019-01-10 07:25:28',
            ),
            24 => 
            array (
                'id' => 25,
                'key' => 'delete_settings',
                'table_name' => 'settings',
                'created_at' => '2019-01-10 07:25:28',
                'updated_at' => '2019-01-10 07:25:28',
            ),
            25 => 
            array (
                'id' => 27,
                'key' => 'browse_ingredients',
                'table_name' => 'ingredients',
                'created_at' => '2019-01-09 12:14:50',
                'updated_at' => '2019-01-09 12:14:50',
            ),
            26 => 
            array (
                'id' => 28,
                'key' => 'read_ingredients',
                'table_name' => 'ingredients',
                'created_at' => '2019-01-09 12:14:50',
                'updated_at' => '2019-01-09 12:14:50',
            ),
            27 => 
            array (
                'id' => 29,
                'key' => 'edit_ingredients',
                'table_name' => 'ingredients',
                'created_at' => '2019-01-09 12:14:50',
                'updated_at' => '2019-01-09 12:14:50',
            ),
            28 => 
            array (
                'id' => 30,
                'key' => 'add_ingredients',
                'table_name' => 'ingredients',
                'created_at' => '2019-01-09 12:14:50',
                'updated_at' => '2019-01-09 12:14:50',
            ),
            29 => 
            array (
                'id' => 31,
                'key' => 'delete_ingredients',
                'table_name' => 'ingredients',
                'created_at' => '2019-01-09 12:14:50',
                'updated_at' => '2019-01-09 12:14:50',
            ),
            30 => 
            array (
                'id' => 32,
                'key' => 'browse_kitchens',
                'table_name' => 'kitchens',
                'created_at' => '2019-01-09 12:16:46',
                'updated_at' => '2019-01-09 12:16:46',
            ),
            31 => 
            array (
                'id' => 33,
                'key' => 'read_kitchens',
                'table_name' => 'kitchens',
                'created_at' => '2019-01-09 12:16:46',
                'updated_at' => '2019-01-09 12:16:46',
            ),
            32 => 
            array (
                'id' => 34,
                'key' => 'edit_kitchens',
                'table_name' => 'kitchens',
                'created_at' => '2019-01-09 12:16:46',
                'updated_at' => '2019-01-09 12:16:46',
            ),
            33 => 
            array (
                'id' => 35,
                'key' => 'add_kitchens',
                'table_name' => 'kitchens',
                'created_at' => '2019-01-09 12:16:46',
                'updated_at' => '2019-01-09 12:16:46',
            ),
            34 => 
            array (
                'id' => 36,
                'key' => 'delete_kitchens',
                'table_name' => 'kitchens',
                'created_at' => '2019-01-09 12:16:46',
                'updated_at' => '2019-01-09 12:16:46',
            ),
            35 => 
            array (
                'id' => 37,
                'key' => 'browse_meals',
                'table_name' => 'meals',
                'created_at' => '2019-01-09 12:17:08',
                'updated_at' => '2019-01-09 12:17:08',
            ),
            36 => 
            array (
                'id' => 38,
                'key' => 'read_meals',
                'table_name' => 'meals',
                'created_at' => '2019-01-09 12:17:08',
                'updated_at' => '2019-01-09 12:17:08',
            ),
            37 => 
            array (
                'id' => 39,
                'key' => 'edit_meals',
                'table_name' => 'meals',
                'created_at' => '2019-01-09 12:17:08',
                'updated_at' => '2019-01-09 12:17:08',
            ),
            38 => 
            array (
                'id' => 40,
                'key' => 'add_meals',
                'table_name' => 'meals',
                'created_at' => '2019-01-09 12:17:08',
                'updated_at' => '2019-01-09 12:17:08',
            ),
            39 => 
            array (
                'id' => 41,
                'key' => 'delete_meals',
                'table_name' => 'meals',
                'created_at' => '2019-01-09 12:17:08',
                'updated_at' => '2019-01-09 12:17:08',
            ),
            40 => 
            array (
                'id' => 42,
                'key' => 'browse_weeks',
                'table_name' => 'weeks',
                'created_at' => '2019-01-09 12:19:29',
                'updated_at' => '2019-01-09 12:19:29',
            ),
            41 => 
            array (
                'id' => 43,
                'key' => 'read_weeks',
                'table_name' => 'weeks',
                'created_at' => '2019-01-09 12:19:29',
                'updated_at' => '2019-01-09 12:19:29',
            ),
            42 => 
            array (
                'id' => 44,
                'key' => 'edit_weeks',
                'table_name' => 'weeks',
                'created_at' => '2019-01-09 12:19:29',
                'updated_at' => '2019-01-09 12:19:29',
            ),
            43 => 
            array (
                'id' => 45,
                'key' => 'add_weeks',
                'table_name' => 'weeks',
                'created_at' => '2019-01-09 12:19:29',
                'updated_at' => '2019-01-09 12:19:29',
            ),
            44 => 
            array (
                'id' => 46,
                'key' => 'delete_weeks',
                'table_name' => 'weeks',
                'created_at' => '2019-01-09 12:19:29',
                'updated_at' => '2019-01-09 12:19:29',
            ),
            45 => 
            array (
                'id' => 47,
                'key' => 'browse_plans',
                'table_name' => 'plans',
                'created_at' => '2019-01-09 12:19:41',
                'updated_at' => '2019-01-09 12:19:41',
            ),
            46 => 
            array (
                'id' => 48,
                'key' => 'read_plans',
                'table_name' => 'plans',
                'created_at' => '2019-01-09 12:19:41',
                'updated_at' => '2019-01-09 12:19:41',
            ),
            47 => 
            array (
                'id' => 49,
                'key' => 'edit_plans',
                'table_name' => 'plans',
                'created_at' => '2019-01-09 12:19:41',
                'updated_at' => '2019-01-09 12:19:41',
            ),
            48 => 
            array (
                'id' => 50,
                'key' => 'add_plans',
                'table_name' => 'plans',
                'created_at' => '2019-01-09 12:19:41',
                'updated_at' => '2019-01-09 12:19:41',
            ),
            49 => 
            array (
                'id' => 51,
                'key' => 'delete_plans',
                'table_name' => 'plans',
                'created_at' => '2019-01-09 12:19:41',
                'updated_at' => '2019-01-09 12:19:41',
            ),
            50 => 
            array (
                'id' => 52,
                'key' => 'browse_meal_category',
                'table_name' => 'meal_category',
                'created_at' => '2019-01-09 12:19:57',
                'updated_at' => '2019-01-09 12:19:57',
            ),
            51 => 
            array (
                'id' => 53,
                'key' => 'read_meal_category',
                'table_name' => 'meal_category',
                'created_at' => '2019-01-09 12:19:57',
                'updated_at' => '2019-01-09 12:19:57',
            ),
            52 => 
            array (
                'id' => 54,
                'key' => 'edit_meal_category',
                'table_name' => 'meal_category',
                'created_at' => '2019-01-09 12:19:57',
                'updated_at' => '2019-01-09 12:19:57',
            ),
            53 => 
            array (
                'id' => 55,
                'key' => 'add_meal_category',
                'table_name' => 'meal_category',
                'created_at' => '2019-01-09 12:19:57',
                'updated_at' => '2019-01-09 12:19:57',
            ),
            54 => 
            array (
                'id' => 56,
                'key' => 'delete_meal_category',
                'table_name' => 'meal_category',
                'created_at' => '2019-01-09 12:19:57',
                'updated_at' => '2019-01-09 12:19:57',
            ),
            55 => 
            array (
                'id' => 57,
                'key' => 'browse_customers',
                'table_name' => 'customers',
                'created_at' => '2019-01-09 12:34:55',
                'updated_at' => '2019-01-09 12:34:55',
            ),
            56 => 
            array (
                'id' => 58,
                'key' => 'read_customers',
                'table_name' => 'customers',
                'created_at' => '2019-01-09 12:34:55',
                'updated_at' => '2019-01-09 12:34:55',
            ),
            57 => 
            array (
                'id' => 59,
                'key' => 'edit_customers',
                'table_name' => 'customers',
                'created_at' => '2019-01-09 12:34:55',
                'updated_at' => '2019-01-09 12:34:55',
            ),
            58 => 
            array (
                'id' => 60,
                'key' => 'add_customers',
                'table_name' => 'customers',
                'created_at' => '2019-01-09 12:34:55',
                'updated_at' => '2019-01-09 12:34:55',
            ),
            59 => 
            array (
                'id' => 61,
                'key' => 'delete_customers',
                'table_name' => 'customers',
                'created_at' => '2019-01-09 12:34:55',
                'updated_at' => '2019-01-09 12:34:55',
            ),
            60 => 
            array (
                'id' => 62,
                'key' => 'browse_meal_categories',
                'table_name' => 'meal_categories',
                'created_at' => '2019-01-09 13:11:33',
                'updated_at' => '2019-01-09 13:11:33',
            ),
            61 => 
            array (
                'id' => 63,
                'key' => 'read_meal_categories',
                'table_name' => 'meal_categories',
                'created_at' => '2019-01-09 13:11:33',
                'updated_at' => '2019-01-09 13:11:33',
            ),
            62 => 
            array (
                'id' => 64,
                'key' => 'edit_meal_categories',
                'table_name' => 'meal_categories',
                'created_at' => '2019-01-09 13:11:33',
                'updated_at' => '2019-01-09 13:11:33',
            ),
            63 => 
            array (
                'id' => 65,
                'key' => 'add_meal_categories',
                'table_name' => 'meal_categories',
                'created_at' => '2019-01-09 13:11:33',
                'updated_at' => '2019-01-09 13:11:33',
            ),
            64 => 
            array (
                'id' => 66,
                'key' => 'delete_meal_categories',
                'table_name' => 'meal_categories',
                'created_at' => '2019-01-09 13:11:33',
                'updated_at' => '2019-01-09 13:11:33',
            ),
            65 => 
            array (
                'id' => 72,
                'key' => 'browse_meal_types',
                'table_name' => 'meal_types',
                'created_at' => '2019-01-15 12:19:42',
                'updated_at' => '2019-01-15 12:19:42',
            ),
            66 => 
            array (
                'id' => 73,
                'key' => 'read_meal_types',
                'table_name' => 'meal_types',
                'created_at' => '2019-01-15 12:19:42',
                'updated_at' => '2019-01-15 12:19:42',
            ),
            67 => 
            array (
                'id' => 74,
                'key' => 'edit_meal_types',
                'table_name' => 'meal_types',
                'created_at' => '2019-01-15 12:19:42',
                'updated_at' => '2019-01-15 12:19:42',
            ),
            68 => 
            array (
                'id' => 75,
                'key' => 'add_meal_types',
                'table_name' => 'meal_types',
                'created_at' => '2019-01-15 12:19:42',
                'updated_at' => '2019-01-15 12:19:42',
            ),
            69 => 
            array (
                'id' => 76,
                'key' => 'delete_meal_types',
                'table_name' => 'meal_types',
                'created_at' => '2019-01-15 12:19:42',
                'updated_at' => '2019-01-15 12:19:42',
            ),
            70 => 
            array (
                'id' => 77,
                'key' => 'browse_customer_meals',
                'table_name' => 'customer_meals',
                'created_at' => '2019-01-22 05:42:21',
                'updated_at' => '2019-01-22 05:42:21',
            ),
            71 => 
            array (
                'id' => 78,
                'key' => 'read_customer_meals',
                'table_name' => 'customer_meals',
                'created_at' => '2019-01-22 05:42:21',
                'updated_at' => '2019-01-22 05:42:21',
            ),
            72 => 
            array (
                'id' => 79,
                'key' => 'edit_customer_meals',
                'table_name' => 'customer_meals',
                'created_at' => '2019-01-22 05:42:21',
                'updated_at' => '2019-01-22 05:42:21',
            ),
            73 => 
            array (
                'id' => 80,
                'key' => 'add_customer_meals',
                'table_name' => 'customer_meals',
                'created_at' => '2019-01-22 05:42:21',
                'updated_at' => '2019-01-22 05:42:21',
            ),
            74 => 
            array (
                'id' => 81,
                'key' => 'delete_customer_meals',
                'table_name' => 'customer_meals',
                'created_at' => '2019-01-22 05:42:21',
                'updated_at' => '2019-01-22 05:42:21',
            ),
            75 => 
            array (
                'id' => 82,
                'key' => 'browse_ingredient_types',
                'table_name' => 'ingredient_types',
                'created_at' => '2019-02-13 06:39:58',
                'updated_at' => '2019-02-13 06:39:58',
            ),
            76 => 
            array (
                'id' => 83,
                'key' => 'read_ingredient_types',
                'table_name' => 'ingredient_types',
                'created_at' => '2019-02-13 06:39:58',
                'updated_at' => '2019-02-13 06:39:58',
            ),
            77 => 
            array (
                'id' => 84,
                'key' => 'edit_ingredient_types',
                'table_name' => 'ingredient_types',
                'created_at' => '2019-02-13 06:39:58',
                'updated_at' => '2019-02-13 06:39:58',
            ),
            78 => 
            array (
                'id' => 85,
                'key' => 'add_ingredient_types',
                'table_name' => 'ingredient_types',
                'created_at' => '2019-02-13 06:39:58',
                'updated_at' => '2019-02-13 06:39:58',
            ),
            79 => 
            array (
                'id' => 86,
                'key' => 'delete_ingredient_types',
                'table_name' => 'ingredient_types',
                'created_at' => '2019-02-13 06:39:58',
                'updated_at' => '2019-02-13 06:39:58',
            ),
        ));
        
        
    }
}