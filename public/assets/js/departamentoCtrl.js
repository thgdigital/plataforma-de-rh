angular.module("app").controller("DepartamentoCtrl", function($scope, OrganizacaoAPI, UserAPI, $location,DepartamentoAPI){
    $scope.departamentos = [];
    $scope.sortField = 'id';
    $scope.reverse = false;

    //CADASTAR NOVO Departamento
    $scope.salvarDepartamento = function(departamento){

        DepartamentoAPI.cadDepartamento(departamento).success(function(data){
            toastr.success('Dados cadastrado com sucesso', 'Dados Cadastrado');
            $location.path('departamento');

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
    //Orderna Tabela
    $scope.doSort = function(event, coluna){
        $scope.sortField = coluna
        $scope.reverse = !$scope.reverse;

        event.preventDefault();
    };

    $scope.open = function () {

        $location.path('cadastrar-departamnto');
    };

    //Buscar dados do departamento
    OrganizacaoAPI.getDepartamento().success(function(data){

        $scope.departamentos = data.departamento;

    }).error(function(data){
        if(typeof data.error != "undefined" && data.error !=""){
            // Display an error toast, with a title
            toastr.error('Você deve está logado para acessar essa pagina', 'Erro faça login!')

            $location.path('login');
        }

    });
});