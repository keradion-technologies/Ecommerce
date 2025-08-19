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
        Schema::create('payment_logs', function (Blueprint $table) {
            $table->id();
            $table->string('uid', 100)->nullable();
            $table->integer('order_id')->nullable();
            $table->integer('order_type')->comment('Digital : 101, Physical : 102');
            $table->integer('user_id')->nullable();
            $table->bigInteger('seller_id')->nullable();
            $table->integer('method_id')->nullable();
            $table->decimal('charge', 18, 8)->nullable();
            $table->decimal('rate', 18, 8)->nullable();
            $table->decimal('amount', 18, 8)->default('0.00000000');
            $table->text('feedback')->nullable();
            $table->decimal('final_amount', 18, 8)->default('0.00000000');
            $table->string('trx_number');
            $table->tinyInteger('status')->default(0)->comment('Pending : 1, Success : 2, Cancel : 3');
            $table->tinyInteger('type')->default(0)->nullable();
            $table->longText('custom_info')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('payment_logs');
    }
};
