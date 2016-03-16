angular.module("app").factory("OrganizacaoAPI", function($http){
	
	// Trago todas organizacao
	var _getOrganizacao= function(){
		
		return $http.get("http://localhost:8000/api/empresa");
	};
	
	//cadastrar Organizacao
	var _saveOrganizacao= function(organizacao){

		return $http.post("http://localhost:8000/api/empresa/salvar", organizacao);
	};
	return {
		getOrganizacao: _getOrganizacao,
		saveOrganizacao: _saveOrganizacao 
	};
});