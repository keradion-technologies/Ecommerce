<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('order_details', function (Blueprint $table) {
            $table->id();
            $table->string('uid', 100)->nullable();
            $table->integer('order_id')->nullable();
            $table->integer('product_id')->nullable();
            $table->integer('digital_product_attribute_id')->nullable();
            $table->integer('quantity')->nullable();
            $table->decimal('total_price', 18, 8)->nullable();
            $table->double('shipping_fee', 20, 8)->default('0.00000000');
            $table->double('original_price', 28, 8);
            $table->longText('tax_amount')->nullable();
            $table->double('taxes', 28, 8)->default('0.00000000');
            $table->double('total_taxes', 28, 0)->default('0');
            $table->double('discount', 28, 8)->default('0.00000000');
            $table->text('attribute')->nullable();
            $table->tinyInteger('status')->default(1)->comment('Placed : 1, Confirmed : 2, Processing : 3, Shipped : 4, Delivered : 5 Cancel : 6');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('order_details');
    }
};