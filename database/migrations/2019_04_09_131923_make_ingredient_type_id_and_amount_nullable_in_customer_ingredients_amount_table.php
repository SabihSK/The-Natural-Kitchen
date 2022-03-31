<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class MakeIngredientTypeIdAndAmountNullableInCustomerIngredientsAmountTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('customer_ingredients_amount', function (Blueprint $table) {
            DB::statement('ALTER TABLE `customer_ingredients_amount` MODIFY `ingredient_type_id` INTEGER UNSIGNED NULL;');
            DB::statement('ALTER TABLE `customer_ingredients_amount` MODIFY `amount` INTEGER NULL;');
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
            DB::statement('ALTER TABLE `customer_ingredients_amount` MODIFY `ingredient_type_id` INTEGER UNSIGNED NOT NULL;');
            DB::statement('ALTER TABLE `customer_ingredients_amount` MODIFY `amount` INTEGER NOT NULL;');
        });
    }
}
