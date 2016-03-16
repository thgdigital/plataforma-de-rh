<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('/', function () {
    return view('admin');
});
//, 'middleware'=>'cors'
Route::post('oauth/access_token', function() {

    return Response::json(Authorizer::issueAccessToken());
});

Route::group(['prefix'=> 'api','middleware' => 'oauth' ], function(){



    Route::group(['as'=> 'em.', 'prefix'=> 'empresa'], function(){

        Route::get('', ['as'=> 'index', 'uses'=> 'EmpresaController@index']);
        Route::get('criar', ['as'=> 'create', 'uses'=> 'EmpresaController@create']);
        Route::post('salvar', ['as'=> 'store', 'uses'=> 'EmpresaController@store']);
        Route::get('{id}/editar', ['as'=> 'edit', 'uses'=> 'EmpresaController@edit']);
        Route::post('{id}/atualizar', ['as'=>'update', 'uses'=> 'EmpresaController@update']);
        Route::get('{id}/remover', ['as'=> 'destroy', 'uses'=> 'EmpresaController@destroy']);
        Route::get('{id}/ver', ['as'=> 'destroy', 'uses'=> 'EmpresaController@show']);
        Route::get('{id}/colaborador', ['as'=> 'colaborador', 'uses'=> 'EmpresaController@colaborador']);
        Route::get('{id}/departamentos', ['as'=> 'departamentos', 'uses'=> 'EmpresaController@departamentos']);
    });
    Route::group(['as'=> 'car.', 'prefix'=> 'cargos'], function(){

        Route::get('', ['as'=> 'index', 'uses'=> 'CargoController@index']);
        Route::get('criar', ['as'=> 'create', 'uses'=> 'CargoController@create']);
        Route::post('{id}/salvar', ['as'=> 'store', 'uses'=> 'CargoController@salve']);
        Route::get('{id}/editar', ['as'=> 'edit', 'uses'=> 'CargoController@edit']);
        Route::post('{id}/atualizar', ['as'=>'update', 'uses'=> 'CargoController@update']);
        Route::get('{id}/remover', ['as'=> 'destroy', 'uses'=> 'CargoController@destroy']);
        Route::get('{id}/ver', ['as'=> 'destroy', 'uses'=> 'CargoController@show']);
        Route::get('{id}/user', ['as'=> 'destroy', 'uses'=> 'CargoController@colaborador']);
        Route::post('{id}/paginacao', ['as'=>'paginacao', 'uses'=> 'CargoController@paginacao']);

    });
    Route::group(['as'=> 'av.', 'prefix'=> 'avalicao'], function(){

        Route::get('', ['as'=> 'index', 'uses'=> 'AvalicaoController@index']);
        Route::get('criar', ['as'=> 'create', 'uses'=> 'AvalicaoController@create']);
        Route::post('{id}/salvar', ['as'=> 'store', 'uses'=> 'AvalicaoController@salve']);
        Route::get('{id}/editar', ['as'=> 'edit', 'uses'=> 'AvalicaoController@edit']);
        Route::post('{id}/atualizar', ['as'=>'update', 'uses'=> 'AvalicaoController@update']);
        Route::get('{id}/remover', ['as'=> 'destroy', 'uses'=> 'AvalicaoController@destroy']);
        Route::get('{id}/ver', ['as'=> 'destroy', 'uses'=> 'AvalicaoController@show']);
        Route::get('{id}/user', ['as'=> 'destroy', 'uses'=> 'AvalicaoController@colaborador']);
        Route::post('avaliado', ['as'=> 'destroy', 'uses'=> 'AvalicaoController@avaliado']);
        Route::post('avaliadores', ['as'=> 'avaliadores', 'uses'=> 'AvalicaoController@avaliadores']);
        Route::post('{id}/paginacao', ['as'=>'paginacao', 'uses'=> 'AvalicaoController@paginacao']);
        Route::post('save-avaliado', ['as'=>'saveAvaliado', 'uses'=> 'AvalicaoController@saveAvaliado']);
        Route::post('{id}/remove-avaliadadores', ['as'=> 'destroy', 'uses'=> 'AvalicaoController@removeAvaliadadores']);
        Route::post('{id}/remove-avaliado', ['as'=> 'removeAvaliado', 'uses'=> 'AvalicaoController@removeAvaliado']);
        Route::post('{id}/competencia', ['as'=> 'competencia', 'uses'=> 'AvalicaoController@competencia']);
        Route::post('{id}/save-competencia', ['as'=> 'saveCompetencia', 'uses'=> 'AvalicaoController@saveCompetencia']);
        Route::post('{id}/avaliacao-competencia', ['as'=> 'avaliaCompetencia', 'uses'=> 'AvalicaoController@avaliaCompetencia']);
        Route::post('{id}/avaliacao-comportamento', ['as'=> 'comportamentoCompetencia', 'uses'=> 'AvalicaoController@comportamentoCompetencia']);

    });
    Route::group(['as'=> 'cat.', 'prefix'=> 'departamentos'], function(){

        Route::get('', ['as'=> 'index', 'uses'=> 'DepartamentoController@index']);
        Route::get('criar', ['as'=> 'create', 'uses'=> 'DepartamentoController@create']);
        Route::post('{id}/salvar', ['as'=> 'store', 'uses'=> 'DepartamentoController@salve']);
        Route::get('{id}/editar', ['as'=> 'edit', 'uses'=> 'DepartamentoController@edit']);
        Route::post('{id}/atualizar', ['as'=>'update', 'uses'=> 'DepartamentoController@update']);
        Route::get('{id}/remover', ['as'=> 'destroy', 'uses'=> 'DepartamentoController@destroy']);
        Route::get('{id}/ver', ['as'=> 'destroy', 'uses'=> 'DepartamentoController@show']);
        Route::get('{id}/cargos', ['as'=> 'cargo', 'uses'=> 'DepartamentoController@cargos']);


    });
    Route::group(['as'=> 'comp.', 'prefix'=> 'competencia'], function(){

        Route::get('', ['as'=> 'index', 'uses'=> 'CompetenciaController@index']);
        Route::get('criar', ['as'=> 'create', 'uses'=> 'CompetenciaController@create']);
        Route::post('{id}/salvar', ['as'=> 'store', 'uses'=> 'CompetenciaController@store']);
        Route::get('{id}/editar', ['as'=> 'edit', 'uses'=> 'CompetenciaController@edit']);
        Route::post('{id}/atualizar', ['as'=>'update', 'uses'=> 'CompetenciaController@update']);
        Route::get('{id}/remover', ['as'=> 'destroy', 'uses'=> 'CompetenciaController@destroy']);
        Route::get('{id}/ver', ['as'=> 'destroy', 'uses'=> 'CompetenciaController@show']);
        Route::get('tipo', ['as'=> 'tipo', 'uses'=> 'CompetenciaController@tipo']);
        Route::get('{id}/comportamento', ['as'=> 'comportamento', 'uses'=> 'CompetenciaController@comportamento']);
        Route::post('{id}/save-comportamento', ['as'=>'saveComportamanto', 'uses'=> 'CompetenciaController@saveComportamanto']);
        Route::post('{id}/update-comportamento', ['as'=>'updateComportamanto', 'uses'=> 'CompetenciaController@updateComportamanto']);
        Route::get('{id}/by-comportamento', ['as'=> 'byComportamanto', 'uses'=> 'CompetenciaController@byComportamanto']);
        Route::get('{id}/not-competencia', ['as'=> 'notCompetencia', 'uses'=> 'CompetenciaController@notCompetencia']);
    });
    Route::group(['as'=> 'user.' ,'prefix'=> 'usersCada'], function(){
        Route::post('criar', ['as'=> 'create', 'uses'=> 'UserController@create']);
    });
    Route::group(['as'=> 'user.' ,'prefix'=> 'users','middleware' => 'oauth' ], function(){

        Route::get('', ['as'=> 'index', 'uses'=> 'UserController@index']);
        Route::post('salvar', ['as'=> 'store', 'uses'=> 'UserController@store']);
        Route::post('end', ['as'=> 'end', 'uses'=> 'UserController@ende']);
        Route::get('{id}/editar', ['as'=> 'edit', 'uses'=> 'UserController@edit']);
        Route::post('{id}/atualizar', ['as'=>'update', 'uses'=> 'UserController@update']);
        Route::get('{id}/remover', ['as'=> 'destroy', 'uses'=> 'UserController@destroy']);
        Route::get('{id}/ver', ['as'=> 'destroy',  'uses'=> 'UserController@show']);
        Route::get('{email}/endereco', ['as'=> 'endereco', 'uses'=> 'UserController@endereco']);
        Route::get('{email}/buscar-dados', ['as'=> 'buscarDados', 'uses'=> 'UserController@buscarDados']);
        Route::get('{id}/user-endereco', ['as'=> 'trazer', 'uses'=> 'UserController@trazerUmEndereco']);
        Route::post('{id}/salve-pedido', ['as'=>'salvePedido', 'uses'=> 'UserController@salvePedido']);
        Route::post('{id}/pedidos', ['as'=>'pedidos', 'uses'=> 'UserController@pedidos']);
        Route::post('{id}/avalidadores', ['as'=>'avalidadores', 'uses'=> 'UserController@avalidadores']);
        Route::get('{id}/colaboradores', ['as'=>'colaboradores', 'uses'=> 'UserController@colaboradores']);
    });
});