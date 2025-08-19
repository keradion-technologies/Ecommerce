<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('mails', function (Blueprint $table) {
            $table->id();
            $table->string('uid', 100)->nullable();
            $table->string('name', 255)->nullable();
            $table->tinyInteger('status')->default(1)->comment('Active : 1 Inactive : 2');
            $table->text('driver_information')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('mails');
    }
};