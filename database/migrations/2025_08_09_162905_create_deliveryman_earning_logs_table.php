<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('deliveryman_earning_logs', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('assigned_id')->nullable();
            $table->unsignedBigInteger('order_id')->nullable();
            $table->unsignedBigInteger('deliveryman_id')->nullable();
            $table->decimal('amount', 18, 8)->default(0.00000000);
            $table->string('details', 191)->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('deliveryman_earning_logs');
    }
};