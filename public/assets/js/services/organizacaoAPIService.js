angular.module("app").factory("OrganizacaoAPI", function($http, $rootScope, config,localStorageService){

	// Trago todas organizacao
	var _getOrganizacao= function(){
		
		return $http.get(config.baseUrlApi+"empresa");
	};
	// Trago todas organizacao
	var _getByOrganizacao = function(){
        return $http({
            method:'GET',
            url: config.baseUrlApi + "empresa/"+ config.empresa_id+"/ver",
            headers:{
                Authorization:"Bearer "+ localStorageService.get('token')
            }
        })
	};
    var _getDepartamento = function(){
        return $http({
            method:'GET',
            url: config.baseUrlApi + "empresa/"+ config.empresa_id+"/departamentos",
            headers:{
                Authorization:"Bearer "+ localStorageService.get('token')
            }
        })
    };




    //Buscar Colaborador
    var _getByColaborador = function(){
        return $http({
            method:'GET',
            url: config.baseUrlApi + "empresa/"+ config.empresa_id+"/colaborador",
            headers:{
                Authorization:"Bearer "+ localStorageService.get('token')
            }
        })
    };
	//Atualizar Organizacao
	var _saveOrganizacao = function(organizacao){

		return $http({
            url: config.baseUrlApi + "empresa/" + config.empresa_id+"/atualizar",
            method:'POST',
            headers:{
                Authorization:"Bearer "+ localStorageService.get('token')
            },
            data:organizacao
        });
	};

	return {
		getOrganizacao: _getOrganizacao,
		saveOrganizacao: _saveOrganizacao,
        getByOrganizacao: _getByOrganizacao,
        getDepartamento:_getDepartamento,
        getByColaborador:_getByColaborador
	};
});