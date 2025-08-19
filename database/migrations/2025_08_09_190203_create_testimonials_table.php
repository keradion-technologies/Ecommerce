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
        Schema::create('testimonials', function (Blueprint $table) {
            $table->id();
            $table->string('uid', 100)->nullable();
            $table->string('author', 191);
            $table->mediumText('quote');
            $table->string('designation', 191)->nullable();
            $table->integer('rating');
            $table->string('image', 191)->nullable();
            $table->tinyInteger('status')->nullable()->comment('Active : 1, Inactive : 0');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('testimonials');
    }
};
