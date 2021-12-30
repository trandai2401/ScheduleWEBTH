<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUserCongviecsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_congviecs', function (Blueprint $table) {
            $table->unsignedBigInteger("id_user");
            $table->unsignedBigInteger("id_congviec");
            $table->integer("laplai")->nullable();
            $table->primary(['id_user', 'id_congviec']);


            $table->foreign('id_user')->references('id')->on('users');
            $table->foreign('id_congviec')->references('id')->on('congviec')->onDelete('cascade');;
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
        Schema::dropIfExists('user_congviecs');
    }
}
