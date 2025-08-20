<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateExclusiveOffersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('exclusive_offers', function (Blueprint $table) {
            $table->id();
            $table->integer('uid')->nullable();
            $table->integer('serial')->nullable();
            $table->unsignedBigInteger('product_id')->nullable();
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
        Schema::dropIfExists('exclusive_offers');
    }
}
