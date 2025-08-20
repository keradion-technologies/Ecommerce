<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('flash_deals', function (Blueprint $table) {
            $table->id();
            $table->string('uid', 100)->nullable();
            $table->string('name', 191);
            $table->string('slug', 191);
            $table->string('banner_image', 255)->nullable();
            $table->longText('products')->nullable();
            $table->timestamp('start_date')->nullable();
            $table->timestamp('end_date')->nullable();
            $table->tinyInteger('status')->default(1)->comment('Active: 1, Inactive: 0');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('flash_deals');
    }
};