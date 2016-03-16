/**
 * Created by albertovieira on 8/11/15.
 *
 */
var app = angular.module('app', ['ngRoute', 'angularMoment', 'ngWig', 'ui.bootstrap', 'angular-loading-bar', 'LocalStorageModule']);

app.config(function ($routeProvider) {

    // For any unmatched url, redirect to /state1
    //
    $routeProvider.when("/perfil", {
        templateUrl: 'views/editar-empresa.html',
        controller: "OrganizacaoCtrl"

    }).when("/dashboard", {
        templateUrl: 'views/dashboard.html'

    }).when("/login", {
        templateUrl: 'views/login.html',
        controller: "LoginCtrl"

    }).when("/organizacao", {
        templateUrl: 'views/organizacao.html',
        controller: "OrganizacaoCtrl"

    }).when("/departamento", {
        templateUrl: 'views/departamento.html',
        controller: "DepartamentoCtrl"

    }).when("/editar-departamento/:id", {
        templateUrl: 'views/editar-departamento.html',
        controller: "EditarDepartamentoCtrl"

    }).when("/cadastrar-departamnto", {
        templateUrl: 'views/cadastro-departamento.html',
        controller: "DepartamentoCtrl"

    }).when("/cadastrar-cargo/:id", {
        templateUrl: 'views/cadastro-cargo.html',
        controller: "NovoCargoCtrl"

    }).when("/cargos/:id", {
        templateUrl: 'views/cargos.html',
        controller: "CargosCtrl"

    }).when("/editar-cargo/:id", {
        templateUrl: 'views/editar-cargo.html',
        controller: "EditarCargoCtrl"

    }).when("/cargos-colaborador/:id", {
        templateUrl: 'views/cargo-colaborador.html',
        controller: "CargosColaboradorCtrl"

    }).when("/colaboradores", {
        templateUrl: 'views/colaboradores.html',
        controller: "ColaboradoresCtrl"

    }).when("/criar-avalicao", {
        templateUrl: 'views/avalicao.html',
        controller: "AvalicoesCtrl"

    }).when("/avalicao-dados/:id", {
        templateUrl: 'views/avalicao-dados.html',
        controller: "AvalicoesDadosCtrl"

    }).when("/listar-avalicoes", {
            templateUrl: 'views/listar-avaliacao.html',
            controller: "ListaAvalicaoCtrl"

        })
        .when("/competencia", {
            templateUrl: 'views/competencia.html',
            controller: "CompetenciaCtrl",

        }).when("/competencia-editar/:id", {
        templateUrl: 'views/competencia-editar.html',
        controller: "CompetenciaEditarCtrl",
        resolve: {
            compentecia: function (CompetenciaAPI, $route, $location) {
                var competencia = CompetenciaAPI.getById($route.current.params.id);

                competencia.success(function (data) {
                    return data;
                }).error(function (data) {
                    if (typeof data.error != "undefined" && data.error != "") {
                        // Display an error toast, with a title
                        toastr.error('Você deve está logado para acessar essa pagina', 'Erro faça login!');
                        $location.path('login');
                    } else {
                        toastr.error('Erro ao buscar os  dados', 'Opss Erro!');
                    }
                });
                return competencia;
            },

            tipo: function (CompetenciaAPI, $location) {
                var tipo = CompetenciaAPI.getTipo();

                tipo.success(function (data) {
                    return data;
                }).error(function (data) {
                    if (typeof data.error != "undefined" && data.error != "") {
                        // Display an error toast, with a title
                        toastr.error('Você deve está logado para acessar essa pagina', 'Erro faça login!');
                        $location.path('login');
                    } else {
                        toastr.error('Erro ao buscar os  dados', 'Opss Erro!');
                    }
                });
                return tipo;
            }
        }

    }).when("/competencia-comportamento/:id", {
        templateUrl: 'views/competencia-comportamento.html',
        controller: "CompetenciaComportamentoCtrl",
        resolve: {
            comportamento: function (CompetenciaAPI, $route, $location) {
                var comportamento = CompetenciaAPI.getByAllComportmanto($route.current.params.id);
                comportamento.success(function (data) {
                    return data;
                }).error(function (data) {
                    if (typeof data.error != "undefined" && data.error != "") {
                        // Display an error toast, with a title
                        toastr.error('Você deve está logado para acessar essa pagina', 'Erro faça login!');
                        $location.path('login');
                    } else {
                        toastr.error('Erro ao buscar os  dados', 'Opss Erro!');
                    }
                })

                return comportamento;
            }
        }

    }).when("/comportamento-editar/:id", {
        templateUrl: 'views/comportamento-editar.html',
        controller: "ComportamentoEditarCtrl",
        resolve: {
            comportamento: function (CompetenciaAPI, $route,$location) {

                var comportamento = CompetenciaAPI.getByComportamento($route.current.params.id);
                comportamento.success(function (data) {
                    return data;
                }).error(function (data) {
                    if (typeof data.error != "undefined" && data.error != "") {
                        // Display an error toast, with a title
                        toastr.error('Você deve está logado para acessar essa pagina', 'Erro faça login!');
                        $location.path('login');
                    } else {
                        toastr.error('Erro ao buscar os  dados', 'Opss Erro!');
                    }
                })

                return comportamento;

            }
        }

    });
    $routeProvider.otherwise("login");
}).config(function (cfpLoadingBarProvider, localStorageServiceProvider) {
    cfpLoadingBarProvider.includeSpinner = true;
    localStorageServiceProvider.setPrefix('token');
});
