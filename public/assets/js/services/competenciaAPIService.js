/**
 * Created by ConQuist on 01/02/2016.
 */
angular.module("app").factory("CompetenciaAPI", function($http,config,$rootScope,localStorageService){

    // Trago todas organizacao
    var _getTipo= function () {

        return $http({
            method: 'GET',
            url: config.baseUrlApi + "competencia/tipo",
            headers: {
                Authorization: "Bearer " + localStorageService.get('token')
            }
        });
    };

    var _getBy = function(){
        return $http({
            method: 'GET',
            url: config.baseUrlApi + "competencia/"+config.empresa_id+"/ver",
            headers: {
                Authorization: "Bearer " + localStorageService.get('token')
            }
        });
    };
    var _getByPaginatio = function(page){
        return $http({
            method: 'GET',
            url: config.baseUrlApi + "competencia/"+config.empresa_id+"/ver?page="+page,
            headers: {
                Authorization: "Bearer " + localStorageService.get('token')
            }
        });
    };
    var _saveComptencia = function(competencia){
        return $http({
            method: 'POST',
            url: config.baseUrlApi + "competencia/"+config.empresa_id+"/salvar",
            headers: {
                Authorization: "Bearer " + localStorageService.get('token')
            },
            data:competencia
        });
    };
    var _getById = function(id){
        return $http({
            method: 'GET',
            url: config.baseUrlApi + "competencia/"+id+"/editar",
            headers: {
                Authorization: "Bearer " + localStorageService.get('token')
            }
        });
    };
    var _saveCompetencia = function(competencia){
        return $http({
            method: 'POST',
            url: config.baseUrlApi + "competencia/"+config.empresa_id+"/atualizar",
            headers: {
                Authorization: "Bearer " + localStorageService.get('token')
            },
            data:competencia
        });
    };
    var _getByAllComportmanto = function(id){
        return $http({
            method: 'GET',
            url: config.baseUrlApi + "competencia/"+id+"/comportamento",
            headers: {
                Authorization: "Bearer " + localStorageService.get('token')
            }
        });
    };
    var _getByComportamento = function(id){
        return $http({
            method: 'GET',
            url: config.baseUrlApi + "competencia/"+id+"/by-comportamento",
            headers: {
                Authorization: "Bearer " + localStorageService.get('token')
            }
        });
    };
    var _saveComportamanto = function(comportamento,id){
        return $http({
            method: 'POST',
            url: config.baseUrlApi + "competencia/"+id+"/save-comportamento",
            headers: {
                Authorization: "Bearer " + localStorageService.get('token')
            },
            data:comportamento
        });
    };
    var _updateComportamanto = function(comportamento,id){
        return $http({
            method: 'POST',
            url: config.baseUrlApi + "competencia/"+id+"/update-comportamento",
            headers: {
                Authorization: "Bearer " + localStorageService.get('token')
            },
            data:comportamento
        });
    };
    var _notCompetencia = function(id){
        return $http({
            method: 'GET',
            url: config.baseUrlApi + "competencia/"+id+"/not-competencia",
            headers: {
                Authorization: "Bearer " + localStorageService.get('token')
            }
        });
    };

    return{
        getTipo:_getTipo,
        getBy:_getBy,
        getByPaginatio:_getByPaginatio,
        saveComptencia:_saveComptencia,
        getById:_getById,
        saveCompetencia:_saveCompetencia,
        getByAllComportmanto:_getByAllComportmanto,
        saveComportamanto:_saveComportamanto,
        getByComportamento:_getByComportamento,
        updateComportamanto:_updateComportamanto,
        notCompetencia:_notCompetencia

    }
});