<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateWeekMealsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('week_meals', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('week_id');
            $table->foreign('week_id')->references('id')->on('weeks')->onDelete('cascade');
            $table->unsignedInteger('meal_type_id');
            $table->foreign('meal_type_id')->references('id')->on('meal_types')->onDelete('cascade');
            $table->unsignedInteger('meal_id');
            $table->foreign('meal_id')->references('id')->on('meals')->onDelete('cascade');
            $table->date('date');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('week_meal');
    }
}
