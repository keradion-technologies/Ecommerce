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
        Schema::create('payment_methods', function (Blueprint $table) {
            $table->id();
            $table->string('uid', 100)->nullable();
            $table->unsignedInteger('currency_id')->nullable();
            $table->decimal('percent_charge', 18, 8)->nullable();
            $table->decimal('rate', 18, 8)->nullable();
            $table->string('name')->nullable();
            $table->string('unique_code', 50)->nullable();
            $table->string('image')->nullable();
            $table->text('payment_parameter');
            $table->tinyInteger('status')->default(0)->comment('Active : 1, Inactive : 2');
            $table->tinyInteger('type')->default(1);
            $table->string('owner_type', 191)->nullable();
            $table->unsignedBigInteger('owner_id')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('payment_methods');
    }
};
