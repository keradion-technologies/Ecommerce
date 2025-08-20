<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('customer_seller_conversations', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('customer_id');
            $table->unsignedBigInteger('seller_id');
            $table->enum('sender_role', ['customer', 'seller']);
            $table->text('message');
            $table->text('files')->nullable();
            $table->tinyInteger('is_seen')->default(0)->comment('Yes: 1, No: 0');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('customer_seller_conversations');
    }
};