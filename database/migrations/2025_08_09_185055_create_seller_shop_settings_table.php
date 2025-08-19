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
        Schema::create('seller_shop_settings', function (Blueprint $table) {
            $table->id();
            $table->integer('uid');
            $table->unsignedInteger('seller_id');
            $table->string('short_details')->nullable();
            $table->string('name')->nullable();
            $table->string('whatsapp_number', 191)->nullable();
            $table->string('whatsapp_order', 121)->nullable();
            $table->string('email', 120)->nullable();
            $table->string('phone', 120)->nullable();
            $table->string('address')->nullable();
            $table->string('shop_logo')->nullable();
            $table->string('seller_site_logo')->default('default.png');
            $table->string('shop_first_image')->nullable();
            $table->string('shop_second_image')->nullable();
            $table->string('shop_third_image')->nullable();
            $table->string('logoicon')->nullable();
            $table->tinyInteger('status')->default(2)->comment('Enable : 1, Disable : 2');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('seller_shop_settings');
    }
};
