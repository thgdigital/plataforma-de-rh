/**
 * Created by admin on 03/01/16.
 */
angular.module("app").factory("DepartamentoAPI", function($http,config,$rootScope,localStorageService){

    // Trago todas organizacao
    var _getDepartamento = function(){

        return $http({
            method:'GET',
            url:config.baseUrlApi + "departamentos",
            headers:{
                Authorization:"Bearer "+localStorageService.get('token')
            }
        });
    };
    var _getByDepartamento = function(id){
        return $http({
            method:'GET',
            url:config.baseUrlApi + "departamentos/"+id+"/editar",
            headers:{
                Authorization:"Bearer "+localStorageService.get('token')
            }
        });
    }
    //Trazer dados cargo com departamento
    var _getByCargo = function(id){
        return $http({
            method:'GET',
            url:config.baseUrlApi + "departamentos/"+id+"/cargos",
            headers:{
                Authorization:"Bearer "+localStorageService.get('token')
            }
        });
    }
    //cadastrar Departamento
    var _cadDepartamento = function(departamento){
        return $http(
            {
            method:'POST',
            url:config.baseUrlApi + "departamentos/"+config.empresa_id+"/salvar" ,
            headers:{
            Authorization:"Bearer "+localStorageService.get('token')
        },
            data:departamento

        });

    };
    var _saveDepartamento = function(departamento,id){
        return $http({
            method:'POST',
            url:config.baseUrlApi + "departamentos/"+id+"/atualizar" ,
            headers:{
            Authorization:"Bearer "+localStorageService.get('token')
        },
        data:departamento

        });

    };
    return {
        getDepartamento: _getDepartamento,
        cadDepartamento: _cadDepartamento,
        saveDepartamento: _saveDepartamento,
        getByDepartamento:_getByDepartamento,
        getByCargo:_getByCargo,

    };

});