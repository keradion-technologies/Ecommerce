<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('news_latters', function (Blueprint $table) {
            $table->id();
            $table->string('uid', 100)->nullable();
            $table->string('heading', 255)->nullable();
            $table->string('banner_image', 255)->nullable();
            $table->longText('description')->nullable();
            $table->string('time_unit', 255)->nullable();
            $table->string('time_duration', 255)->nullable();
            $table->string('discount_percentage', 255)->nullable();
            $table->string('discount', 255)->default('Active');
            $table->string('status', 255)->default('Active');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('news_latters');
    }
};