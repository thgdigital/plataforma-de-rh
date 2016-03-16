/**
 * Created by admin on 03/01/16.
 */
angular.module("app").factory("CargoAPI", function($http,config,$rootScope,localStorageService){

    // Trago todas organizacao
    var _getCargo = function(){

        return $http({
            method:'GET',
            url:config.baseUrlApi + "cargos",
            headers:{
                Authorization:"Bearer "+localStorageService.get('token')
            }
        });
    };
    var _getByCargo = function(id){
        return $http({
            method:'GET',
            url:config.baseUrlApi + "cargos/"+id+"/editar",
            headers:{
                Authorization:"Bearer "+localStorageService.get('token')
            }
        });
    }

    //cadastrar Departamento
    var _cadCargo = function(cargo, id){

        return $http(
            {
            method:'POST',
            url:config.baseUrlApi + "cargos/"+id+"/salvar" ,
            headers:{
            Authorization:"Bearer "+localStorageService.get('token')
        },
            data:{
                nome:cargo.nome,
                descricao:cargo.descricao,
            }

        });

    };
    var _saveCargo = function(cargo,id){
        return $http(
            {
            method:'POST',
            url:config.baseUrlApi + "cargos/"+id+"/atualizar" ,
            headers:{
            Authorization:"Bearer "+localStorageService.get('token')
        },
        data:cargo

        });

    };
    var _getByUser = function(id){
        return $http(
            {
                method:'GET',
                url:config.baseUrlApi + "cargos/"+id+"/user" ,
                headers:{
                    Authorization:"Bearer "+localStorageService.get('token')
                }

            });

    };
    return {
        getCargo: _getCargo,
        cadCargo: _cadCargo,
        saveCargo: _saveCargo,
        getByCargo:_getByCargo,
        getByUser:_getByUser

    };

});