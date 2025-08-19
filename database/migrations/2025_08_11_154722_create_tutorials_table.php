<?php

use App\Enums\StatusEnum;
use App\Enums\TutorialAudience;
use App\Enums\TutorialPlatform;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTutorialsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tutorials', function (Blueprint $table) {
            $table->id();
            $table->string('uid')->unique()->index();
            $table->unsignedBigInteger('created_by')->nullable();
            $table->unsignedBigInteger('updated_by')->nullable();
            $table->enum('status', StatusEnum::toArray())->default(StatusEnum::true->status())->comment('Active: 1, Inactive: 0');
            $table->enum('platform', TutorialPlatform::toArray())->nullable();
            $table->enum('audience', TutorialAudience::toArray())->nullable();
            $table->string('title')->nullable();
            $table->text('description')->nullable();
            $table->longText('files')->nullable();
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
        Schema::dropIfExists('tutorials');
    }
}
