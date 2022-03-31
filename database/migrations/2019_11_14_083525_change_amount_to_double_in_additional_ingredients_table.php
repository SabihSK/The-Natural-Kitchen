<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class ChangeAmountToDoubleInAdditionalIngredientsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('additional_ingredients', function (Blueprint $table) {
            $table->float('amount')->after('ingredient_id')->change();
        });
//        Schema::table('customer_meals', function (Blueprint $table) {
//            $table->float('total_calories')->after('ingredient_id')->change();
//        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('additional_ingredients', function (Blueprint $table) {
            $table->integer('amount')->after('ingredient_id')->change();
        });
//        Schema::table('customer_meals', function (Blueprint $table) {
//            $table->integer('total_calories')->after('ingredient_id')->change();
//        });
    }
}
