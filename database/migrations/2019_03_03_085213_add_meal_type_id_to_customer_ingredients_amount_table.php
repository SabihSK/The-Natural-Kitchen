<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddMealTypeIdToCustomerIngredientsAmountTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('customer_ingredients_amount', function (Blueprint $table) {
            $table->unsignedInteger('meal_type_id')->nullable();
            $table->foreign('meal_type_id')->references('id')->on('meal_types');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('customer_ingredients_amount', function (Blueprint $table) {
            $table->dropColumn('meal_type_id');
            $table->dropColumn('meal_type_id');
        });
    }
}
