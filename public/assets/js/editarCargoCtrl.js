/**
 * Created by admin on 04/01/16.
 */
angular.module("app").controller("EditarCargoCtrl", function($scope, OrganizacaoAPI, UserAPI, $location,DepartamentoAPI,$routeParams,CargoAPI){
    var parametros = $routeParams.id;
    $scope.cargo = [];

    CargoAPI.getByCargo(parametros).success(function(data){
        $scope.cargo = data[0];

    }).error(function(data){
        if (typeof data.error != "undefined" && data.error != "") {
            // Display an error toast, with a title
            toastr.error('Você deve está logado para acessar essa pagina', 'Erro faça login!');

            $location.path('login');
        }else{
            toastr.error('Acontenceu algum error', 'Opss error!');
        }
    });

    $scope.atualizarCargo = function(cargo){

        CargoAPI.saveCargo(cargo, parametros).success(function(data){

            if (typeof data.error != "undefined" && data.error == false) {
                toastr.success('Dados alterado com sucesso', 'Dados Alterado');
                $location.path('cargos/'+cargo.id);
            }else{
                toastr.error('Error ao salvar dados', 'Opss error!');
            }

        }).error(function(data){
            if (typeof data.error != "undefined" && data.error != "") {
                // Display an error toast, with a title
                toastr.error('Você deve está logado para acessar essa pagina', 'Erro faça login!');

                $location.path('login');
            }else{
                toastr.error('Acontenceu algum error', 'Opss error!');
            }
        });
    }

});
