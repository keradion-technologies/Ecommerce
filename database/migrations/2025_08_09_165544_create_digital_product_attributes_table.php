<?php

use App\Enums\StatusEnum;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('digital_product_attributes', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('uid', 100)->nullable();
            $table->unsignedBigInteger('product_id')->nullable();
            $table->string('name', 255)->nullable();
            $table->decimal('price', 18, 8)->default(0.00000000);
            $table->string('short_details', 100)->nullable();
            $table->enum('status', StatusEnum::toArray())->default(StatusEnum::true->status())->comment('Available : 1, Sold : 0');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('digital_product_attributes');
    }
};