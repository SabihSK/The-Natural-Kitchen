<?php

use Illuminate\Database\Seeder;

class MealSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(App\Meal::class, 20)->create()->each(function ($meal) {
            $ingredients = \App\Ingredient::inRandomOrder()->get()->take(rand(2,7));
            foreach ($ingredients as $ing) {
                $meal->ingredients()->attach($ing, ['amount' => rand(50, 100)]);
            }

            $meal->total_calories = $meal->getTotalCalories();
            $meal->total_fats = $meal->getTotalFats();
            $meal->total_proteins = $meal->getTotalProteins();
            $meal->total_carbs = $meal->getTotalCarb();

            $meal->save();
        });

    }
}
