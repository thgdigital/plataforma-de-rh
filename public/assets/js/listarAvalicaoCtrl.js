/**
 * Created by ConQuist on 29/01/2016.
 */
angular.module("app").controller("ListaAvalicaoCtrl", function ($scope, AvalicaoAPI, $location) {
    $scope.sortField = 'id';
    $scope.reverse = false;
    $scope.doSort = function(event, coluna){
        $scope.sortField = coluna
        $scope.reverse = !$scope.reverse;

        event.preventDefault();
    };
    AvalicaoAPI.getAvalicao().success(function (resposta) {
        $scope.avalicoes = resposta.data;
        $scope.totalItems = resposta.total;
        $scope.currentPage = resposta.current_page;
        $scope.numPages = resposta.per_page;
        $scope.bigTotalItems = resposta.per_page;

    }).error(function (data) {
        if (typeof data.error != "undefined" && data.error != "") {
            // Display an error toast, with a title
            toastr.error('Você deve está logado para acessar essa pagina', 'Erro faça login!');
            $location.path('login');
        } else {
            toastr.error('Erro ao alterar dados', 'Opss Erro!');
        }
    });
});
