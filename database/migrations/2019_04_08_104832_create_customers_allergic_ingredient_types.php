<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCustomersAllergicIngredientTypes extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customers_allergic_ingredient_types', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('ingredient_type_id');
            $table->foreign('ingredient_type_id')->references('id')->on('ingredient_types');
            $table->unsignedInteger('customer_id');
            $table->foreign('customer_id')->references('id')->on('customers');
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
        Schema::drop('customers_allergic_ingredient_types');
    }
}
