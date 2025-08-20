<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('digital_product_attribute_values', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('uid', 100)->nullable();
            $table->integer('digital_product_attribute_id');
            $table->string('name', 191)->nullable();
            $table->text('value')->nullable();
            $table->string('file', 255)->nullable();
            $table->tinyInteger('status')->default(1);
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('digital_product_attribute_values');
    }
};