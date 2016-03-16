<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAvalicaoUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('avalicao_users', function (Blueprint $table) {
            $table->increments('id');

            $table->integer('avalicao_id')->unsigned();
            $table->foreign('avalicao_id')->references('id')->on('avalicoes');

            $table->integer('tipo_id')->unsigned();
            $table->foreign('tipo_id')->references('id')->on('tipo_avaliadores');

            $table->integer('avalidado_id')->unsigned();
            $table->foreign('avalidado_id')->references('id')->on('users');

            $table->integer('avalidador_id')->unsigned();
            $table->foreign('avalidador_id')->references('id')->on('users');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down(){

        Schema::drop('avalicao_users');
    }
}
