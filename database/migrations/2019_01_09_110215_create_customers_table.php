<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCustomersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customers', function (Blueprint $table) {
            $table->increments('id');
            $table->string('fullname');
            $table->string('title');
            $table->integer('age');
            $table->date('birthdate');
            $table->tinyInteger('gender');
            $table->double('height');
            $table->double('weight');
            $table->double('waist_measurements');
            $table->double('hip_measurements');
            $table->string('blood_type');
            $table->text('address');
            $table->string('mobile');
            $table->string('telephone');
            $table->string('email')->unique();
            $table->text('medical_history');
            $table->text('present_medication');
            $table->text('exercise_frequency');
            $table->tinyInteger('alchohol');
            $table->tinyInteger('smoke');
            $table->tinyInteger('pregnancy');
            $table->tinyInteger('breastfeeding');
            $table->text('vaccinations');
            $table->string('worktype');
            $table->tinyInteger('weightchange');
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
        Schema::drop('customers');
    }
}
