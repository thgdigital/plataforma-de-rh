angular.module("app").controller("CargosColaboradorCtrl", function($scope, OrganizacaoAPI, UserAPI, $location,DepartamentoAPI,$routeParams,$uibModal, $log,CargoAPI){


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

    //Buscar dados do departamento e cargos
    CargoAPI.getByUser(parametros).success(function(data){
        $scope.colaboradores = data.dado_user;
        $scope.cargo = data.cargo[0];

    }).error(function(data){
        if(typeof data.error != "undefined" && data.error !=""){
            // Display an error toast, with a title
            toastr.error('Você deve está logado para acessar essa pagina', 'Erro faça login!')

            $location.path('login');
        }
    });

});
