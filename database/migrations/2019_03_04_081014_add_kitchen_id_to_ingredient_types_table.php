<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddKitchenIdToIngredientTypesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('ingredient_types', function (Blueprint $table) {
            $table->unsignedInteger('kitchen_id')->nullable();
            $table->foreign('kitchen_id')->references('id')->on('kitchens')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('ingredient_types', function (Blueprint $table) {
            $table->dropColumn('kitchen_id');
            $table->dropColumn('kitchen_id');
        });
    }
}
