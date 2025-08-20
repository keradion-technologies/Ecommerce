<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('kyc_logs', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('seller_id')->nullable();
            $table->unsignedBigInteger('deliveryman_id')->nullable();
            $table->longText('custom_data')->nullable();
            $table->text('feedback');
            $table->tinyInteger('status');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('kyc_logs');
    }
};