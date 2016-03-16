angular.module("app").controller("ColaboradoresCtrl", function($scope, OrganizacaoAPI, UserAPI, $location,DepartamentoAPI,$routeParams,$uibModal, $log,$routeParams){

    var parametros = $routeParams.id;

    $scope.colaboradores = [];
    $scope.sortField = 'id';
    $scope.reverse = false;


    $scope.open= function(){
        $location.path('cadastrar-cargo/'+parametros);
    }

    //Orderna Tabela
    $scope.doSort = function(event, coluna){
        $scope.sortField = coluna
        $scope.reverse = !$scope.reverse;

        event.preventDefault();
    };


    $scope.pageChanged = function () {

        UserAPI.getCompetenciaPagination($scope.currentPage).success(function (resposta) {
            $scope.colaboradores = resposta;
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
                toastr.error('Erro ao remover os  dados', 'Opss Erro!');
            }
        });

    };



    //Buscar dados do departamento e cargos
    UserAPI.getByColaboradores().success(function(data){

        $scope.colaboradores = data;
        $scope.totalItems = data.total;
        $scope.currentPage = data.current_page;
        $scope.numPages = data.per_page;
        $scope.bigTotalItems = data.per_page;

    }).error(function(data){
        if(typeof data.error != "undefined" && data.error !=""){
            // Display an error toast, with a title
            toastr.error('Você deve está logado para acessar essa pagina', 'Erro faça login!')

            $location.path('login');
        }
    });

});
