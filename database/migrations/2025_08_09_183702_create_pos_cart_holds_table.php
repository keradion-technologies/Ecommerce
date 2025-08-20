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
        Schema::create('pos_cart_holds', function (Blueprint $table) {
            $table->id();
            $table->string('uid', 100)->nullable(false);
            $table->unsignedBigInteger('admin_id')->nullable();
            $table->unsignedBigInteger('seller_id')->nullable();
            $table->longText('cart_items');
            $table->longText('summary_meta')->nullable();
            $table->text('note')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pos_cart_holds');
    }
};
