/**
 * Created by ConQuist on 01/02/2016.
 */
angular.module("app").controller("CompetenciaEditarCtrl", function($scope, $location,$log,CompetenciaAPI ,compentecia, tipo){
    $scope.competencia = compentecia.data;
    $scope.tipos = tipo.data;
    
    $scope.salvarCompetencia = function (competencia){
        CompetenciaAPI.saveCompetencia(competencia).success(function(data){
            if(typeof data.error != "undefined" && data.error == false){
                toastr.success('Dados Alterado com sucesso', 'Alteração concluída');
                $location.path('competencia');
            }
        }).error(function(data){
            if (typeof data.error != "undefined" && data.error != "") {
                // Display an error toast, with a title
                toastr.error('Você deve está logado para acessar essa pagina', 'Erro faça login!');
                $location.path('login');
            } else {
                toastr.error('Erro ao atualizar os  dados', 'Opss Erro!');
            }
        });
    }
});