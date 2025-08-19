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
        Schema::create('withdraws', function (Blueprint $table) {
            $table->id();
            $table->unsignedInteger('seller_id')->nullable();
            $table->bigInteger('user_id')->nullable();
            $table->bigInteger('deliveryman_id')->nullable();
            $table->unsignedInteger('method_id')->nullable();
            $table->unsignedInteger('currency_id')->nullable();
            $table->decimal('amount', 18, 8)->default('0.00000000');
            $table->double('rate', 20, 8)->default('0.00000000');
            $table->decimal('charge', 18, 8)->nullable();
            $table->string('trx_number')->nullable();
            $table->decimal('final_amount', 18, 8)->default('0.00000000');
            $table->text('withdraw_information')->nullable();
            $table->text('feedback')->nullable();
            $table->tinyInteger('status')->default(0)->comment('success : 1, pending : 2, reject : 3');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('withdraws');
    }
};
