<?php

use App\Enums\StatusEnum;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('campaign_products', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('uid', 100)->nullable()->index();
            $table->unsignedBigInteger('campaign_id');
            $table->unsignedBigInteger('product_id');
            $table->enum('discount_type', StatusEnum::toArray())->default(StatusEnum::true->status())->comment('Percent: 1, Flat: 0');
            $table->string('discount', 255)->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('campaign_products');
    }
};