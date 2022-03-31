<?php

use Illuminate\Database\Seeder;

class CustomMenuItemsTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        \DB::table('menu_items')->insert(array (
            7 => 
            array (
                'menu_id' => 1,
                'title' => 'Ingredients',
                'url' => '',
                'target' => '_self',
                'icon_class' => 'voyager-params',
                'color' => '#000000',
                'parent_id' => NULL,
                'order' => 5,
                'created_at' => '2019-01-09 12:14:50',
                'updated_at' => '2019-01-09 12:45:10',
                'route' => 'voyager.ingredients.index',
                'parameters' => 'null',
            ),
            8 => 
            array (
                'menu_id' => 1,
                'title' => 'Kitchens',
                'url' => '',
                'target' => '_self',
                'icon_class' => 'voyager-lab',
                'color' => '#000000',
                'parent_id' => NULL,
                'order' => 6,
                'created_at' => '2019-01-09 12:16:46',
                'updated_at' => '2019-01-09 12:45:10',
                'route' => 'voyager.kitchens.index',
                'parameters' => 'null',
            ),
            9 => 
            array (
                'menu_id' => 1,
                'title' => 'Meals',
                'url' => '',
                'target' => '_self',
                'icon_class' => 'voyager-pizza',
                'color' => '#000000',
                'parent_id' => NULL,
                'order' => 8,
                'created_at' => '2019-01-09 12:17:08',
                'updated_at' => '2019-01-09 13:12:01',
                'route' => 'voyager.meals.index',
                'parameters' => 'null',
            ),
            10 => 
            array (
                'menu_id' => 1,
                'title' => 'Weeks',
                'url' => '',
                'target' => '_self',
                'icon_class' => 'voyager-calendar',
                'color' => '#000000',
                'parent_id' => NULL,
                'order' => 8,
                'created_at' => '2019-01-09 12:19:29',
                'updated_at' => '2019-01-09 12:45:24',
                'route' => 'voyager.weeks.index',
                'parameters' => 'null',
            ),
            11 => 
            array (
                'menu_id' => 1,
                'title' => 'Plans',
                'url' => '',
                'target' => '_self',
                'icon_class' => 'voyager-file-text',
                'color' => '#000000',
                'parent_id' => NULL,
                'order' => 7,
                'created_at' => '2019-01-09 12:19:41',
                'updated_at' => '2019-01-09 12:45:22',
                'route' => 'voyager.plans.index',
                'parameters' => 'null',
            ),
            12 => 
            array (
                'menu_id' => 1,
                'title' => 'Customers',
                'url' => '',
                'target' => '_self',
                'icon_class' => 'voyager-people',
                'color' => '#000000',
                'parent_id' => NULL,
                'order' => 4,
                'created_at' => '2019-01-09 12:34:55',
                'updated_at' => '2019-01-09 12:44:59',
                'route' => 'voyager.customers.index',
                'parameters' => 'null',
            ),
            13 => 
            array (
                'menu_id' => 1,
                'title' => 'Meal Categories',
                'url' => '',
                'target' => '_self',
                'icon_class' => 'voyager-trees',
                'color' => '#000000',
                'parent_id' => NULL,
                'order' => 8,
                'created_at' => '2019-01-09 13:11:33',
                'updated_at' => '2019-01-09 13:12:08',
                'route' => 'voyager.meal-categories.index',
                'parameters' => 'null',
            ),
        ));
        
        
    }
}