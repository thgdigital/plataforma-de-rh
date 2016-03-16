angular.module("app").controller("AvalicoesCtrl", function ($scope, $location, AvalicaoAPI) {
    $scope.open = function () {
        $location.path('cadastrar-cargo/' + parametros);
    }
    $scope.toggleMin = function () {
        $scope.minDate = $scope.minDate ? null : new Date();
    }
    $scope.open = function ($event) {
        $scope.status.opened = true;
    };
    $scope.openFinal = function ($event) {
        $scope.status.final = true;
    };
    $scope.openRelatorio = function ($event) {
        $scope.status.relatorio = true;
    };
    $scope.dateOptions = {
        formatYear: 'yy',
        startingDay: 1
    };
    $scope.status = {
        opened: false,
        final: false,
        relatorio: false
    };
    $scope.minDate = new Date();

    //cadastrar
    $scope.cadastarAvaliacao = function (avaliacao) {

        AvalicaoAPI.saveAvalicao(avaliacao).success(function (data) {
            if (typeof data.id != "undefined" && data.id != "") {
                $location.path('avalicao-dados/' + data.id);
            }
        }).error(function (data) {

            if (typeof data.error != "undefined" && data.error != "") {
                // Display an error toast, with a title
                toastr.error('Você deve está logado para acessar essa pagina', 'Erro faça login!');
                $location.path('login');
            } else {

                toastr.error('Erro ao cadastrar dados', 'Opss Erro!');
            }
        });
    }

});
