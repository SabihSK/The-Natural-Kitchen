<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class ChangeDayColumnToDateInCustomerExcludedDaysTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('customer_excluded_days', function (Blueprint $table) {
            $table->dropColumn('day');
            $table->date('date')->after('customer_id');
            $table->unique(['customer_id', 'date']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('customer_excluded_days', function (Blueprint $table) {
            $table->dropColumn('date');
            $table->date('day');
        });
    }
}
