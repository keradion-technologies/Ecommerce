<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->string('uid', 100)->nullable();
            $table->mediumText('verification_code')->nullable();
            $table->unsignedInteger('shipping_deliverie_id')->nullable();
            $table->unsignedBigInteger('delivery_man_id')->nullable();
            $table->text('payment_id')->nullable();
            $table->unsignedBigInteger('payment_method_id')->nullable();
            $table->unsignedInteger('customer_id')->nullable();
            $table->string('order_id', 255)->nullable();
            $table->unsignedBigInteger('address_id')->nullable();
            $table->tinyInteger('qty')->nullable();
            $table->decimal('shipping_charge', 18, 8)->nullable();
            $table->text('payment_info')->nullable();
            $table->decimal('discount', 18, 8)->nullable();
            $table->decimal('amount', 18, 8)->default('0.00000000');
            $table->double('original_amount', 28, 8)->default('0.00000000');
            $table->double('total_taxes', 28, 8)->default('0.00000000');
            $table->double('delivery_man_charge')->default(0);
            $table->text('billing_information')->nullable();
            $table->longText('payment_details')->nullable();
            $table->tinyInteger('payment_status')->default(1)->comment('Unpaid : 1, Paid : 2');
            $table->tinyInteger('wallet_payment')->nullable();
            $table->tinyInteger('order_type')->default(1)->comment('Digital : 101, Physical : 102');
            $table->string('source', 191)->default('web');
            $table->tinyInteger('payment_type')->default(1)->comment('Cash On Delivery : 1, Payment method : 2');
            $table->longText('custom_information')->nullable();
            $table->tinyInteger('status')->default(1)->comment('Placed : 1, Confirmed : 2, Processing : 3, Shipped : 4, Delivered : 5 Cancel : 6');
            $table->enum('customer_type', ['walk_in', 'existing'])->default('existing')->comment('WALKIN: walkin , EXISTING : existing');
            $table->enum('delivery_option', ['pickup', 'shipping'])->default('shipping')->comment('PICKUP: pick up in store , SHIPPING : ship tp address');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('orders');
    }
};