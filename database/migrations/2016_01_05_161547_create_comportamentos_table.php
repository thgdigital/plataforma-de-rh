<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateComportamentosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('comportamentos', function (Blueprint $table) {
            $table->increments('id');
            $table->string("nome");
            $table->text("descricao");
            $table->integer('compencia_id')->unsigned();
            $table->foreign('compencia_id')->references('id')->on('competencias');
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
        Schema::drop('comportamentos');
    }
}
