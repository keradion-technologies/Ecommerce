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
        Schema::create('withdraw_methods', function (Blueprint $table) {
            $table->id();
            $table->string('uid', 100)->nullable();
            $table->integer('currency_id')->nullable();
            $table->string('name', 70)->nullable();
            $table->string('image', 120)->nullable();
            $table->decimal('min_limit', 18, 8)->default('0.00000000');
            $table->decimal('max_limit', 18, 8)->default('0.00000000');
            $table->string('duration', 40)->nullable();
            $table->decimal('fixed_charge', 18, 8)->default('0.00000000');
            $table->decimal('percent_charge', 18, 8)->default('0.00000000');
            $table->decimal('rate', 18, 8)->default('0.00000000');
            $table->text('user_information')->nullable();
            $table->text('description')->nullable();
            $table->tinyInteger('status')->default(0)->comment('Active : 1, Inactive : 0');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('withdraw_methods');
    }
};
