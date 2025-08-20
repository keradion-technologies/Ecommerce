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
        Schema::create('user_login_infos', function (Blueprint $table) {
            $table->id();
            $table->string('uid', 100)->nullable();
            $table->unsignedBigInteger('user_id');
            $table->string('ip')->nullable();
            $table->string('country')->nullable();
            $table->string('city')->nullable();
            $table->string('browser')->nullable();
            $table->string('os')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('user_login_infos');
    }
};
