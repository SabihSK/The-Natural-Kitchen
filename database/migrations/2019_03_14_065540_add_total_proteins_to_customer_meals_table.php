<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddTotalProteinsToCustomerMealsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('customer_meals', function (Blueprint $table) {
            $table->integer('total_proteins')->default(0);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('customer_meals', function (Blueprint $table) {
            $table->dropColumn('total_proteins');
        });
    }
}
