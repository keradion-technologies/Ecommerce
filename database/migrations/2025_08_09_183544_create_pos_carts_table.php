<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('pos_carts', function (Blueprint $table) {
            $table->id();
            $table->string('uid', 100)->nullable();
            $table->unsignedBigInteger('admin_id')->nullable();
            $table->unsignedBigInteger('seller_id')->nullable();
            $table->unsignedBigInteger('product_id')->nullable();
            $table->unsignedBigInteger('currency_id')->nullable();
            $table->string('session_id', 191)->nullable();
            $table->unsignedBigInteger('customer_id')->nullable();
            $table->string('price', 191)->nullable();
            $table->double('discount', 20, 8)->default(0.00000000);
            $table->double('total_taxes', 20, 8)->default(0.00000000);
            $table->string('total', 100)->nullable();
            $table->double('original_price', 20, 8)->default(0.00000000);
            $table->string('quantity', 191)->nullable();
            $table->longText('taxes')->nullable();
            $table->json('attribute')->nullable();
            $table->string('attributes_value', 200)->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pos_carts');
    }
};
