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
        Schema::create('transactions', function (Blueprint $table) {
            $table->id();
            $table->string('uid', 100)->nullable();
            $table->unsignedInteger('seller_id')->nullable();
            $table->unsignedInteger('user_id')->nullable();
            $table->unsignedBigInteger('deliveryman_id')->nullable();
            $table->longText('guest_user')->nullable();
            $table->decimal('amount', 18, 8)->default('0.00000000');
            $table->decimal('post_balance', 18, 8)->default('0.00000000');
            $table->decimal('post_balance_pos', 18, 8)->default('0.00000000');
            $table->string('transaction_type', 10)->nullable();
            $table->string('source', 191)->default('web');
            $table->string('transaction_number', 70)->nullable();
            $table->string('details')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('transactions');
    }
};
