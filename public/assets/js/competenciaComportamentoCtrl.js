/**
 * Created by ConQuist on 01/02/2016.
 */
angular.module("app").controller("CompetenciaComportamentoCtrl", function($scope, CompetenciaAPI, $location,$uibModal,$log,comportamento,$routeParams){
    $scope.sortField = 'created_at';
    $scope.reverse = true;
    $scope.competencias = [];

   if(comportamento.status == 200){
        $scope.comportamento = comportamento.data;
   }else{
       toastr.error('Você deve está logado para acessar essa pagina', 'Erro faça login!');
       $location.path('login');
   }

    //Orderna Tabela
    $scope.doSort = function(event, coluna){
        $scope.sortField = coluna
        $scope.reverse = !$scope.reverse;

        event.preventDefault();
    };


    $scope.open = function(){
        var modalInstance = $uibModal.open({
            animation: $scope.animationsEnabled,
            templateUrl: 'comportamanto.html',
            controller: 'ModalComportamentoCtrl',
            size: 'lg',

        });

        modalInstance.result.then(function (selectedItem) {

            CompetenciaAPI.saveComportamanto(selectedItem,$routeParams.id).success(function(data){
                $scope.comportamento.comportamentos.push(data);
                toastr.success('Comportamanto cadastrado com sucesso', 'Dados inserido com sucesso');

            }).error(function(data){
                if (typeof data.error != "undefined" && data.error != "") {
                    // Display an error toast, with a title
                    toastr.error('Você deve está logado para acessar essa pagina', 'Erro faça login!');
                    $location.path('login');
                } else {
                    toastr.error('Erro ao cadastrar os  dados', 'Opss Erro!');
                }
            });

        });


    }
});
///Modal de cadastramento de Competencia
angular.module('app').controller('ModalComportamentoCtrl', function ($scope, $uibModalInstance) {
    $scope.ok = function () {
        $uibModalInstance.close($scope.selected.item);
    };
    $scope.tipos = [];
    $scope.cadastrar = function(comportamanto){
        $uibModalInstance.close(comportamanto);
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };
});