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
        Schema::create('product_ratings', function (Blueprint $table) {
            $table->id();
            $table->string('uid', 100)->nullable();
            $table->unsignedBigInteger('user_id');
            $table->unsignedBigInteger('product_id');
            $table->decimal('rating', 18, 8);
            $table->string('review');
            $table->tinyInteger('status')->default(0)->comment('Active : 1 ,Inactive : 0');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('product_ratings');
    }
};
