/**
 * Created by admin on 03/01/16.
 */
angular.module("app").factory("AvalicaoAPI", function ($http, config, $rootScope, localStorageService) {

    // Trago todas organizacao
    var _getAvalicao = function (id) {

        return $http({
            method: 'GET',

            url: config.baseUrlApi + "avalicao/" +config.empresa_id+"/ver",

            headers: {
                Authorization: "Bearer " + localStorageService.get('token')
            }
        });
    };
    // Trago todas organizacao
    var _getByAva = function (id) {

        return $http({
            method: 'GET',
            url: config.baseUrlApi + "avalicao/" +id+"/editar",

            headers: {
                Authorization: "Bearer " + localStorageService.get('token')
            }
        });
    };
    var _saveAvaliadoComAvalidador = function (dados) {

        return $http({
            url: config.baseUrlApi + "avalicao/save-avaliado",
            method: 'POST',
            headers: {
                Authorization: "Bearer " + localStorageService.get('token')
            },
            data: dados
        });
    }
    var _getByAvalicao = function (email, token) {
        return $http({
            method: 'GET',
            url: config.baseUrlApi + "avalicao/" + email + "/buscar-dados",
            headers: {
                Authorization: "Bearer " + localStorageService.get('token')
            }
        });
    };
    var _getBuscarDadosAvalicao = function (id) {
        return $http({
            method: 'GET',
            url: config.baseUrlApi + "avalicao/" + id + "/ver",
            headers: {
                Authorization: "Bearer " + localStorageService.get('token')
            }
        });
    };
    var _getBuscarDadosAvaliado = function (id, param) {
        return $http({
            method: 'POST',
            url: config.baseUrlApi + "avalicao/avaliado",
            headers: {
                Authorization: "Bearer " + localStorageService.get('token')
            },
            data: {
                avalicao: param,
                avalido_id: id
            }
        });
    };
    var _getBuscarDadosAvaliadores = function (id, param) {
        return $http({
            method: 'POST',
            url: config.baseUrlApi + "avalicao/avaliadores",
            headers: {
                Authorization: "Bearer " + localStorageService.get('token')
            },
            data: {
                avalicao: param,
                avaliador_id: id
            }
        });
    };
    var _getByColaboradores = function () {
        return $http({
            method: 'GET',
            url: config.baseUrlApi + "users/" + config.empresa_id + "/colaboradores",
            headers: {
                Authorization: "Bearer " + localStorageService.get('token')
            }
        });
    };
    //Buscar Colaboradores nâo usado ainda para esse usuario
    var _getNotColaboradores = function (dados, parametros) {
        return $http({
            method: 'POST',
            url: config.baseUrlApi + "users/" + parametros + "/avalidadores",
            headers: {
                Authorization: "Bearer " + localStorageService.get('token')
            },
            data: dados

        });
    };
    //Buscar Competencias
    var _getCompetencia = function (ids) {

        return $http({
            method: 'POST',
            url: config.baseUrlApi + "avalicao/" +config.client_id + "/competencia",
            headers: {
                Authorization: "Bearer " + localStorageService.get('token')
            },
            data:{id:ids}

        });
    };
    //Buscar Competencias Pagination
    var _getCompetenciaPagination = function (id,ids) {
        return $http({
            method: 'POST',
            url: config.baseUrlApi + "avalicao/" +config.client_id + "/competencia?page="+id,
            headers: {
                Authorization: "Bearer " + localStorageService.get('token')
            },
            data:{id:ids}
        });
    };

    //Buscar Competencias Pagination
    var _getCompetenciaAvalicaoPagination = function (id,ids) {
        return $http({
            method: 'POST',
            url: config.baseUrlApi + "avalicao/" +config.client_id + "/avaliacao-competencia?page="+id,
            headers: {
                Authorization: "Bearer " + localStorageService.get('token')
            },
            data:{id:ids}
        });
    };

    //Remover Avaliador
    var _removerAvaliadores = function (dados, parametros) {
        return $http({
            method: 'POST',
            url: config.baseUrlApi + "avalicao/" + parametros + "/remove-avaliadadores",
            headers: {
                Authorization: "Bearer " + localStorageService.get('token')
            },
            data: dados

        });
    };
    //Remover Avaliado
    var _removerAvaliado = function (dados, parametros) {
        return $http({
            method: 'POST',
            url: config.baseUrlApi + "avalicao/" + parametros + "/remove-avaliado",
            headers: {
                Authorization: "Bearer " + localStorageService.get('token')
            },
            data: dados

        });
    };



    //cadastrar Avalicao
    var _saveAvalicao = function (avalicao) {
        return $http(
            {
                method: 'POST',
                url: config.baseUrlApi + "avalicao/" + config.empresa_id + "/salvar",
                headers: {
                    Authorization: "Bearer " + localStorageService.get('token')
                },
                data: avalicao
            });

    };

    //Salvar competencia com a avaliacao
    var _saveAvalicaoCompetencia = function (competencia, id) {
        return $http(
            {
                method: 'POST',
                url: config.baseUrlApi + "avalicao/" +id + "/save-competencia",
                headers: {
                    Authorization: "Bearer " + localStorageService.get('token')
                },
                data: competencia
            });

    };

    //cadastrar Avalicao
    var _atualizarAvalicao = function (avalicao, id) {
        return $http(
            {
                method: 'POST',
                url: config.baseUrlApi + "avalicao/" + id + "/atualizar",
                headers: {
                    Authorization: "Bearer " + localStorageService.get('token')
                },
                data: avalicao
            });

    };
    //Buscar competencia com a avalição
    var _getAvaliacaoCompetencia = function (parametro) {
        return $http(
            {
                method: 'POST',
                url: config.baseUrlApi + "avalicao/" + config.empresa_id + "/avaliacao-competencia",
                headers: {
                    Authorization: "Bearer " + localStorageService.get('token')
                },
                data:{id:parametro }
            });

    };
    //Buscar competencia com o comportamento

    var _getAvaliacaoComportamento = function (parametro) {
        return $http(
            {
                method: 'POST',
                url: config.baseUrlApi + "avalicao/" + config.empresa_id + "/avaliacao-comportamento",
                headers: {
                    Authorization: "Bearer " + localStorageService.get('token')
                },
                data:{id:parametro }
            });
    };
    return {
        getAvalicao: _getAvalicao,
        saveAvalicao: _saveAvalicao,
        getByAvalicao: _getByAvalicao,
        getByAva:_getByAva,
        getBuscarDadosUser: _getBuscarDadosAvalicao,
        getByColaboradores: _getByColaboradores,
        atualizarAvalicao: _atualizarAvalicao,
        getBuscarDadosAvaliado: _getBuscarDadosAvaliado,
        getBuscarDadosAvaliadores: _getBuscarDadosAvaliadores,
        getNotColaboradores: _getNotColaboradores,
        saveAvaliadoComAvalidador: _saveAvaliadoComAvalidador,
        removerAvaliadores:_removerAvaliadores,
        removerAvaliado:_removerAvaliado,
        getCompetencia:_getCompetencia,
        getCompetenciaPagination:_getCompetenciaPagination,
        saveAvalicaoCompetencia:_saveAvalicaoCompetencia,
        getAvaliacaoCompetencia:_getAvaliacaoCompetencia,
        getCompetenciaAvalicaoPagination:_getCompetenciaAvalicaoPagination,
        getAvaliacaoComportamento:_getAvaliacaoComportamento
    };
});