/**
 * Created by admin on 03/01/16.
 */
angular.module("app").factory("UserAPI", function($http,config,localStorageService ){

    // Trago todas organizacao
    var _getUser = function(){

        return $http({
            method:'GET',
            url:config.baseUrlApi + "users",
            headers:{
                Authorization:"Bearer "+ localStorageService.get('token')
            }
        });
    };
    var _getByUser = function(email,token){
        return $http({
            method:'GET',
            url: config.baseUrlApi + "users/"+email+"buscar-dados",
            headers:{
                Authorization:"Bearer "+token
            }
        });
    };
    var _getBuscarDadosUser = function(id){
        return $http({
            method:'GET',
            url: config.baseUrlApi + "users/"+id+"ver",
            headers:{
                Authorization:"Bearer "+localStorageService.get('token')
            }
        });
    };
    var _getByColaboradores = function(){
        return $http({
            method:'GET',
            url: config.baseUrlApi + "users/"+config.empresa_id+"/colaboradores",
            headers:{
                Authorization:"Bearer "+localStorageService.get('token')
            }
        });
    };
    //cadastrar User
    var _saveUser = function(user){
        return $http.post(config.baseUrlApi +"users/salvar", user);
    };
    //Buscar User Pagination
    var _getCompetenciaPagination = function (id) {
        return $http({
            method: 'get',
            url: config.baseUrlApi + "users/" +config.client_id + "/colaboradores?page="+id,
            headers: {
                Authorization: "Bearer " + localStorageService.get('token')
            },

        });
    };
    return {
        getUser: _getUser,
        saveUser: _saveUser,
        getByUser: _getByUser,
        getBuscarDadosUser:_getBuscarDadosUser,
        getByColaboradores:_getByColaboradores,
        getCompetenciaPagination:_getCompetenciaPagination
    };
});