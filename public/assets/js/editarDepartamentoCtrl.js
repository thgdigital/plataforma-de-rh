/**
 * Created by admin on 04/01/16.
 */
angular.module("app").controller("EditarDepartamentoCtrl", function($scope, OrganizacaoAPI, UserAPI, $location,DepartamentoAPI,$routeParams){
    var parametros = $routeParams.id;
    $scope.departamento = [];
    DepartamentoAPI.getByDepartamento(parametros).success(function(data){
        $scope.departamento = data;
    }).error(function(data){
        if (typeof data.error != "undefined" && data.error != "") {
            // Display an error toast, with a title
            toastr.error('Você deve está logado para acessar essa pagina', 'Erro faça login!');

            $location.path('login');
        }else{
            toastr.error('Acontenceu algum error', 'Opss error!');
        }
    });

    $scope.atualizarDepartamento = function(departamento){

        DepartamentoAPI.saveDepartamento(departamento, parametros).success(function(data){

            if (typeof data.error != "undefined" && data.error == false) {
                toastr.success('Dados alterado com sucesso', 'Dados Alterado');
                $location.path('departamento');
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
