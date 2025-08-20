<?php

use App\Enums\StatusEnum;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFaqsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('faqs', function (Blueprint $table) {
            $table->id();
            $table->string('uid', 100)->nullable();
            $table->string('support_category', 255);
            $table->string('question', 255);
            $table->longText('answer')->nullable();
            $table->enum('status', StatusEnum::toArray())->default(StatusEnum::true->status())->comment('Active : 1,Inactive : 0');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('faqs');
    }
}
