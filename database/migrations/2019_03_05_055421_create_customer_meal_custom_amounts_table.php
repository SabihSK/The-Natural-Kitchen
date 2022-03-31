<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCustomerMealCustomAmountsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customer_meal_amounts', function (Blueprint $table) {
            $table->unsignedInteger('customer_meal_id');
            $table->foreign('customer_meal_id', 'cmamounts_cm')->references('id')->on('customer_meals')->onDelete('cascade');
            $table->unsignedInteger('ingredient_type_id');
            $table->foreign('ingredient_type_id', 'cmamounts_it')->references('id')->on('ingredient_types')->onDelete('cascade');
            $table->integer('amount');
            $table->primary(['customer_meal_id', 'ingredient_type_id'], 'cmid_itid_pk');
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
        Schema::drop('customer_meal_custom_amounts');
    }
}
