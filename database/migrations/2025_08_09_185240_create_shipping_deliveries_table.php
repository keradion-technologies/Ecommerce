<?php

use App\Enums\StatusEnum;
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
        Schema::create('shipping_deliveries', function (Blueprint $table) {
            $table->id();
            $table->string('image')->nullable();
            $table->string('uid', 100)->nullable();
            $table->string('name', 120)->nullable();
            $table->unsignedInteger('method_id')->nullable();
            $table->string('duration', 120)->nullable();
            $table->decimal('price', 18, 8)->default('0.00000000');
            $table->longText('price_configuration')->nullable();
            $table->text('description')->nullable();
            $table->tinyInteger('status')->default(0)->comment('Active : 1, Inactive : 0');
            $table->enum('free_shipping', StatusEnum::toArray())->nullable();
            $table->enum('shipping_type', ['price_wise', 'weight_wise'])->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('shipping_deliveries');
    }
};
