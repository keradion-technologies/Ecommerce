<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('carts', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('uid', 100)->nullable()->index();
            $table->unsignedInteger('user_id')->nullable();
            $table->unsignedInteger('campaign_id')->nullable();
            $table->unsignedInteger('product_id')->nullable();
            $table->bigInteger('currency_id')->nullable();
            $table->string('session_id', 255)->nullable();
            $table->string('price', 255)->nullable();
            $table->double('discount', 20, 8)->default(0.00000000);
            $table->double('total_taxes', 20, 8)->default(0.00000000);
            $table->string('total', 100)->nullable();
            $table->double('original_price', 20, 8);
            $table->string('quantity', 255)->nullable();
            $table->longText('taxes')->nullable();
            $table->json('attribute')->nullable();
            $table->string('attributes_value', 200)->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('carts');
    }
};