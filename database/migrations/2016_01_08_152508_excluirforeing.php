<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class Excluirforeing extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::table('dados_users', function ($table) {

            $table->integer('departamento_cargos_id')->unsigned()->after('empresa_id');
            $table->foreign('departamento_cargos_id')->references('id')->on('departamento_cargos');
            $table->dropForeign(["departamento_id","cargo_id"]);
            $table->dropColumn(['departamento_id', 'cargo_id']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
