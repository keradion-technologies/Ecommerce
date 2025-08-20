<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('deliveryman_password_resets', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('identifier', 191)->index();
            $table->string('uid', 100)->nullable()->index();
            $table->string('token', 255)->index();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('deliveryman_password_resets');
    }
};