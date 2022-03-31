<?php

use Faker\Generator as Faker;

$factory->define(\App\Customer::class, function (Faker $faker) {
    $gender = rand(0, 1);
    $gender_array = ['female', 'male'];
    $plans = \App\Plan::all()->pluck('id');
    return [
        'fullname' => $faker->name($gender_array[$gender]),
        'title' => $faker->title($gender_array[$gender]),
        'age' => rand(20, 40),
        'birthdate' => $faker->date(),
        'gender' => $gender,
        'height' => rand(160, 190),
        'weight' => rand(80, 120),
        'waist_measurements' => rand(40, 80),
        'hip_measurements' => rand(40, 80),
        'blood_type' => 'A',
        'address' => $faker->text(400),
        'mobile' => $faker->phoneNumber,
        'telephone' => $faker->phoneNumber,
        'email' => $faker->email,
        'medical_history' => $faker->text(),
        'present_medication' => $faker->text(),
        'exercise_frequency' => rand(0, 2),
        'alchohol' => rand(0, 1),
        'smoke' => rand(0, 1),
        'pregnancy' => rand(0, 1),
        'breastfeeding' => rand(0, 1),
        'vaccinations' => rand(0, 1),
        'worktype' => $faker->text(),
        'weightchange' => rand(0, 1),
        'created_at' => \Carbon\Carbon::now(),
        'plan_id' => $plans[rand(0, count($plans)-1)],
        'status' => 1
    ];
});
