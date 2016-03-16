/**
 * Created by ConQuist on 01/02/2016.
 */
angular.module("app").controller("ComportamentoEditarCtrl", function($scope, CompetenciaAPI, $location,$uibModal,$log,comportamento,$routeParams){

   if(comportamento.status == 200){
        $scope.comportamento = comportamento.data;
   }else{
       toastr.error('Você deve está logado para acessar essa pagina', 'Erro faça login!');
       $location.path('login');
   };
    $scope.salvarComportamento = function(comportamanto){
        CompetenciaAPI.updateComportamanto(comportamanto,$routeParams.id).success(function(data){
            toastr.success('Comportamanto atualizado com sucesso', 'Dados alteredo com sucesso');
            $location.path('competencia-comportamento/'+$scope.comportamento.competencia_id );

        }).error(function(data){
            if (typeof data.error != "undefined" && data.error != "") {
                // Display an error toast, with a title
                toastr.error('Você deve está logado para acessar essa pagina', 'Erro faça login!');
                $location.path('login');
            } else {
                toastr.error('Erro ao cadastrar os  dados', 'Opss Erro!');
            }
        });
    };

    /*

    */
});
