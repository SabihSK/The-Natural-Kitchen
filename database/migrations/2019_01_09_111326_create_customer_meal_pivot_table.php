<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCustomerMealPivotTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customer_meal', function (Blueprint $table) {
            $table->integer('customer_id')->unsigned()->index();
            $table->foreign('customer_id')->references('id')->on('customers')->onDelete('cascade');
            $table->integer('meal_id')->unsigned()->index();
            $table->foreign('meal_id')->references('id')->on('meals')->onDelete('cascade');
//            $table->primary(['customer_id', 'meal_id', 'meal_category_id']);
//            $table->integer('meal_category_id')->unsigned()->index();
//            $table->foreign('meal_category_id')->references('id')->on('meal_categories')->onDelete('cascade');
            $table->date('date');
            $table->primary(['customer_id', 'meal_id', 'date']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('customer_meal');
    }
}
