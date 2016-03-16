angular.module("app").controller("NovoCargoCtrl", function($scope, OrganizacaoAPI, UserAPI, $location,DepartamentoAPI,$routeParams,$uibModal, $log,CargoAPI){

    var parametros = $routeParams.id;

    $scope.departamento = [];
    $scope.cargo= [];
    $scope.sortField = 'id';
    $scope.reverse = false;

    //CADASTAR NOVO Cargo
    $scope.salvarCargo = function(cargo){

        CargoAPI.cadCargo(cargo,parametros).success(function(data){
            if (typeof data.error != "undefined" && data.error == false) {
                toastr.success('Dados cadastrado com sucesso', 'Dados Cadastrado');
                $location.path('cargos/'+parametros);
            } else {
                toastr.error('Erro ao cadastrar dados', 'Opss Erro!');
            }


        }).error(function(data){

            if(typeof data.error != "undefined" && data.error !=""){
                // Display an error toast, with a title
                toastr.error('Você deve está logado para acessar essa pagina', 'Erro faça login!');
                $location.path('login');
            }else{
                toastr.error('Error ao cadastrar', 'OPSS Erro!');
            }
        });

    };
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
    DepartamentoAPI.getByCargo(parametros).success(function(data){
        $scope.departamento = data;

    }).error(function(data){
        if(typeof data.error != "undefined" && data.error !=""){
            // Display an error toast, with a title
            toastr.error('Você deve está logado para acessar essa pagina', 'Erro faça login!')

            $location.path('login');
        }
    });

});
