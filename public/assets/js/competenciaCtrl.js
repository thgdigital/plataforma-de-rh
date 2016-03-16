/**
 * Created by ConQuist on 01/02/2016.
 */
angular.module("app").controller("CompetenciaCtrl", function($scope, CompetenciaAPI, $location,$uibModal,$log){
    $scope.sortField = 'created_at';
    $scope.reverse = true;
    $scope.competencias=[];

    //Orderna Tabela
    $scope.doSort = function(event, coluna){
        $scope.sortField = coluna
        $scope.reverse = !$scope.reverse;

        event.preventDefault();
    };

    $scope.excluir = function(competencia,event){
        var resposta = confirm("Deseja remover esse registro?");

        if (resposta == true) {
            var modalInstance = $uibModal.open({
                animation: $scope.animationsEnabled,
                templateUrl: 'ExcluirCompetencia.html',
                controller: 'ModalExcluirCompetenciaCtrl',
                size: 'sm',
                backdrop:'static',
                resolve:{
                    competencia:competencia
                }
            });

            modalInstance.result.then(function (selectedItem) {
                $scope.selected = selectedItem;
            }, function () {
                $log.info('Modal dismissed at: ' + new Date());
            });
        }
    }

$scope.excluirSim = function(competencia){

}
    $scope.open = function(){
        var modalInstance = $uibModal.open({
            animation: $scope.animationsEnabled,
            templateUrl: 'competencia.html',
            controller: 'ModalComptenciaCtrl',

            size: 'lg',
            resolve:{
                tipo:function(CompetenciaAPI){
                    return CompetenciaAPI.getTipo();
                }
            }

        });
        modalInstance.result.then(function (selectedItem) {
            CompetenciaAPI.saveComptencia(selectedItem).success(function(data){
                toastr.success('Compêtencia cadastrada com sucesso', 'Dados inserido com sucesso')
                $scope.competencias.push(data);
            }).error(function(data){
                if (typeof data.error != "undefined" && data.error != "") {
                    // Display an error toast, with a title
                    toastr.error('Você deve está logado para acessar essa pagina', 'Erro faça login!');
                    $location.path('login');
                } else {
                    toastr.error('Erro ao cadastrar os  dados', 'Opss Erro!');
                }
            });

            $log.info(selectedItem);
        }, function () {
            $log.info('Modal dismissed at: ' + new Date());
        });

    }

    $scope.pageChanged = function () {
        CompetenciaAPI.getByPaginatio($scope.currentPage).success(function (resposta) {
            $scope.competencias = resposta.data;
        }).error(function (data) {
            if (typeof data.error != "undefined" && data.error != "") {
                // Display an error toast, with a title
                toastr.error('Você deve está logado para acessar essa pagina', 'Erro faça login!');
                $location.path('login');
            } else {
                toastr.error('Erro ao remover os  dados', 'Opss Erro!');
            }
        });


    };

    CompetenciaAPI.getBy().success(function(resposta){
        $scope.competencias = resposta.data;
        $scope.totalItems = resposta.total;
        $scope.currentPage = resposta.current_page;
        $scope.numPages = resposta.per_page;
        $scope.bigTotalItems = resposta.per_page;

    }).error(function(data){
        if (typeof data.error != "undefined" && data.error != "") {
            // Display an error toast, with a title
            toastr.error('Você deve está logado para acessar essa pagina', 'Erro faça login!');
            $location.path('login');
        } else {
            toastr.error('Erro ao buscar os  dados', 'Opss Erro!');
        }
    });
});
///Modal de cadastramento de Competencia
angular.module('app').controller('ModalComptenciaCtrl', function ($scope, $uibModalInstance,tipo) {
    $scope.ok = function () {
        $uibModalInstance.close($scope.selected.item);
    };
    $scope.tipos = tipo.data;
    $scope.cadastrar = function(competencia){
        $uibModalInstance.close(competencia);
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };
});
///Modal de Excluir de Competencia
angular.module('app').controller('ModalExcluirCompetenciaCtrl', function ($scope,CompetenciaAPI ,$uibModalInstance,competencia) {


    CompetenciaAPI.notCompetencia(competencia.id).success(function(data){
        $scope.notCompetencia = data;
    }).error(function(data){
        if (typeof data.error != "undefined" && data.error != "") {
            // Display an error toast, with a title
            toastr.error('Você deve está logado para acessar essa pagina', 'Erro faça login!');
            $location.path('login');
        } else {
            toastr.error('Erro ao buscar os  dados', 'Opss Erro!');
        }
    });
    $scope.notCompe = false;




    $scope.ok = function () {

        if (typeof $scope.not.competencia != "undefined" && $scope.not.competencia != null) {
            $scope.notCompe = false;
        }else{
            $scope.notCompe = true;
        }



    };

    $scope.competenciaExcluir = competencia.nome;

    $scope.cadastrar = function(competencia){
        $uibModalInstance.close(competencia);
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };
});