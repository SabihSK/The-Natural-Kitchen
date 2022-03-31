<?php

use Faker\Generator as Faker;

$factory->define(\App\Ingredient::class, function (Faker $faker) {
    return [
        'name' => $faker->text(10).' (Ingredient)',
        'protein' => rand(50, 300),
        'fat' => rand(50, 300),
        'carbohydrates' => rand(50, 300),
        'calories' => rand(50, 500),
    ];
});
