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
        Schema::create('sellers', function (Blueprint $table) {
            $table->id();
            $table->string('uid', 100)->nullable();
            $table->longText('fcm_token')->nullable();
            $table->string('name')->nullable();
            $table->string('username', 70)->nullable();
            $table->string('email', 70)->nullable();
            $table->integer('rating')->nullable();
            $table->string('image', 191)->nullable();
            $table->string('phone', 70)->nullable();
            $table->text('address')->nullable();
            $table->decimal('balance', 18, 8)->default('0.00000000');
            $table->string('password')->nullable();
            $table->tinyInteger('best_seller_status')->default(1)->comment('No : 1, Yes : 2');
            $table->tinyInteger('status')->default(0)->comment('Active : 1, Banned : 0');
            $table->smallInteger('kyc_status')->nullable();
            $table->decimal('pos_balance', 18, 8)->default('0.00000000');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sellers');
    }
};
