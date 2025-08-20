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
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('uid', 100)->nullable();
            $table->integer('product_type')->nullable()->comment('Digital Product : 101,  Physical Product : 102');
            $table->unsignedInteger('seller_id')->nullable();
            $table->string('warranty_policy')->nullable();
            $table->unsignedInteger('brand_id')->nullable();
            $table->unsignedInteger('category_id')->nullable();
            $table->unsignedInteger('sub_category_id')->nullable();
            $table->string('name')->nullable();
            $table->string('sku', 191)->nullable();
            $table->string('barcode', 191)->nullable();
            $table->string('slug')->nullable();
            $table->decimal('price', 18, 8)->default('0.00000000')->nullable();
            $table->double('shipping_fee', 20, 8)->default('0.00000000');
            $table->tinyInteger('shipping_fee_multiply')->nullable();
            $table->decimal('discount', 18, 8)->nullable();
            $table->decimal('discount_percentage', 18, 8)->nullable();
            $table->string('featured_image')->nullable();
            $table->text('short_description')->nullable();
            $table->text('description')->nullable();
            $table->text('shipping_country')->nullable();
            $table->text('attributes')->nullable();
            $table->string('variant_product')->nullable();
            $table->text('attributes_value')->nullable();
            $table->string('meta_title')->nullable();
            $table->string('meta_image')->nullable();
            $table->string('meta_keywords')->nullable();
            $table->text('meta_description')->nullable();
            $table->integer('minimum_purchase_qty')->nullable();
            $table->integer('maximum_purchase_qty')->nullable();
            $table->tinyInteger('top_status')->default(1)->comment('No : 1, Yes : 2');
            $table->tinyInteger('featured_status')->default(1)->comment('No : 1, Yes : 2');
            $table->tinyInteger('best_selling_item_status')->default(1)->comment('No : 1, Yes : 2');
            $table->tinyInteger('is_suggested')->default(0)->comment('Yes:1 , No :0');
            $table->double('weight', 20, 8)->default('0.00000000')->nullable();
            $table->mediumInteger('point')->default(0);
            $table->longText('custom_fileds')->nullable();
            $table->tinyInteger('status')->default(0)->comment('New : 0, Published : 1, Inactive : 2');
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
