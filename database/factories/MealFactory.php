<?php

use Faker\Generator as Faker;

$factory->define(\App\Meal::class, function (Faker $faker) {
    $kitchens = \App\Kitchen::all()->pluck('id');
    $meal_types = \App\MealType::all()->pluck('id');
    return [
        'name' => $faker->text(15).' (Meal)',
        'kitchen_id' => array_random($kitchens->toArray()),
        'meal_type_id' => array_random($meal_types->toArray()),
        'custom' => 0,
        'total_calories' => 0,
        'total_fats' => 0,
        'total_proteins' => 0,
        'total_carbs' => 0,
    ];
});