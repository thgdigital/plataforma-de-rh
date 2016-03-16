angular.module("app").controller("AvalicoesDadosCtrl", function ($scope, $filter, $location, AvalicaoAPI, $uibModal, $log, $routeParams, OrganizacaoAPI) {
    var parametros = $routeParams.id;


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
    //Função de atualizar Avalição
    $scope.AtualizarAvalicao = function (avalicoes, id) {

        AvalicaoAPI.saveAvalicao(avalicoes, id).success(function (data) {

            if (typeof data.error != "undefined" && data.error == false) {
                toastr.success('Dados alterado com sucesso', 'Dados Alterado');

            } else {
                toastr.error('Error ao alterar dados', 'Opss error!');
            }
        }).error(function (data) {
            if (typeof data.error != "undefined" && data.error != "") {
                // Display an error toast, with a title
                toastr.error('Você deve está logado para acessar essa pagina', 'Erro faça login!');
                $location.path('login');
            } else {
                toastr.error('Erro ao alterar dados', 'Opss Erro!');
            }
        });
    };

    /*****************************************************************************
     * Aqui começar a parte de selecionar o avaliador
     *********************************************************************************/



    $scope.activeAvaliado = '';
    $scope.minDate = new Date();
    $scope.avalicoes = [];

    var avaliador = "";
    $scope.selectedAll = false;
    //Checar todos
    $scope.checkAll = function (avaliadores) {
        if ($scope.selectedAll) {
            $scope.selectedAll = false;
        } else {
            $scope.selectedAll = true;
        }
        angular.forEach(avaliadores, function (avaliador) {
            avaliador.selecionado = $scope.selectedAll;


        });

    };

    //Apagar Tudo de uma vez
    $scope.apagarAvaliadores = function (avaliadores, avaliado) {

        var selecionado = avaliadores.filter(function (avaliador) {
            if (avaliador.selecionado) return avaliador;
        });
        angular.forEach(selecionado, function (item) {
            var dados = {
                avalidador_id: item.id,
                avalidado_id: avaliado
            }

            AvalicaoAPI.removerAvaliadores(dados, parametros).success(function (data) {
                var index = $scope.avalidores.indexOf(avaliador);
                $scope.avalidores.splice(index, 1);
                toastr.success('Avaliador removido com sucesso', 'Dados Alterado');
            }).error(function (data) {
                if (typeof data.error != "undefined" && data.error != "") {
                    // Display an error toast, with a title
                    toastr.error('Você deve está logado para acessar essa pagina', 'Erro faça login!');
                    $location.path('login');
                } else {
                    toastr.error('Erro ao remover os  dados', 'Opss Erro!');
                }
            });
        });

    };
    $scope.isAvaliadoresSelecionado = function (avaliadores) {
        return avaliadores.some(function (avaliador) {
            return avaliador.selecionado;
        });

    };

    //Remover o avaliador
    $scope.removerAvalidor = function (avaliador, avaliado) {
        var dados = {
            avalidador_id: avaliador.id,
            avalidado_id: avaliado
        };

        AvalicaoAPI.removerAvaliadores(dados, parametros).success(function (data) {
            var index = $scope.avalidores.indexOf(avaliador);
            $scope.avalidores.splice(index, 1);

            toastr.success('Avaliador removido com sucesso', 'Dados Alterado');
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

    //Quando o usuario mudar o valor do select
    $scope.changedValue = function (avaliador, tipochage, avaliado) {
        var dados = {
            avalidador_id: avaliador.id,
            avalicao_id: parametros,
            tipo_id: tipochage,
            avalidado_id: avaliado
        };

        AvalicaoAPI.saveAvaliadoComAvalidador(dados).success(function (data) {
            avaliadores.push(avaliador);
            toastr.success('Dados alterado com sucesso', 'Dados Alterado');
        }).error(function (data) {
            if (typeof data.error != "undefined" && data.error != "") {
                // Display an error toast, with a title
                toastr.error('Você deve está logado para acessar essa pagina', 'Erro faça login!');
                $location.path('login');
            } else {
                toastr.error('Erro ao alterar dados', 'Opss Erro!');
            }
        });
    }
    $scope.avalidores = [];

    $scope.openModal = function () {
        var avalidador = [];
        AvalicaoAPI.getNotColaboradores(avaliadores, parametros).success(function (data) {
            avalidador = data;
            modalInstance = $uibModal.open({
                animation: $scope.animationsEnabled,
                templateUrl: 'modalAvaliado.html',
                controller: 'ModalAvaliadoCtrl',
                resolve: {
                    items: function () {
                        return avalidador;
                    }
                }
            });
            modalInstance.result.then(function (selectedItem) {
                avaliador = selectedItem;
                $scope.avalidores.push(avaliador);
            }, function () {
                $log.info('Modal dismissed at: ' + new Date());
            });
        }).error(function (data) {
            if (typeof data.error != "undefined" && data.error != "") {
                // Display an error toast, with a title
                toastr.error('Você deve está logado para acessar essa pagina', 'Erro faça login!');
                $location.path('login');
            } else {
                toastr.error('Erro ao buscar dados', 'Opss Erro!');
            }
        });

    };

    var avaliadores = [];
    $scope.avalia = true;
    $scope.avaliad = true;
    $scope.activeAvaliado = "";
    $scope.avaliado = [];
    $scope.total_avaliado = "";
    $scope.tipos = [];

    OrganizacaoAPI.getByColaborador().success(function (data) {
        $scope.avaliado = data.dados.result;
        $scope.tipos = data.dados.tipo;
        $scope.total_avaliado = data.dados.length;

    }).error(function (data) {

        if (typeof data.error != "undefined" && data.error != "") {

            // Display an error toast, with a title
            toastr.error('Você deve está logado para acessar essa pagina', 'Erro faça login!');

            $location.path('login');
        } else {
            toastr.error('Erro ao buscar dados', 'Opss Erro!');
        }

    });
    $scope.avalido = function (event, id) {


        $scope.avalia = false;
        $scope.activeAvaliado = id;

        AvalicaoAPI.getBuscarDadosAvaliado(id, parametros).success(function (data) {
            avaliadores = [];
            $scope.avalidores = [];
            $scope.avalidores = data;
            angular.forEach($scope.avalidores, function (item) {
                avaliadores.push(item);
            });

        }).error(function (data) {
            if (typeof data.error != "undefined" && data.error != "") {
                // Display an error toast, with a title
                //  toastr.error('Você deve está logado para acessar essa pagina', 'Erro faça login!');
                $location.path('login');
            } else {
                toastr.error('Erro ao buscar dados', 'Opss Erro!');
            }
        });

        event.preventDefault();
    }
    AvalicaoAPI.getByAva(parametros).success(function (data) {
        $scope.avalicoes = data;

    }).error(function (data) {
        if (typeof data.error != "undefined" && data.error != "") {
            // Display an error toast, with a title
            //  toastr.error('Você deve está logado para acessar essa pagina', 'Erro faça login!');
            $location.path('login');
        } else {
            toastr.error('Erro ao buscar dados', 'Opss Erro!');
        }
    });


    /*********************************************************************************
     * Aqui termina a parte de selecionar o avaliador
     *********************************************************************************/


    /*****************************************************************************
     * Aqui começar a parte de selecionar o avaliado
     *********************************************************************************/

    $scope.avaliadores = function (event, id) {
        $scope.avaliad = false;
        $scope.activeAvaliadores = id;

        AvalicaoAPI.getBuscarDadosAvaliadores(id, parametros).success(function (data) {
            avaliadores = [];
            $scope.avaliados = [];
            $scope.avaliados = data;
            angular.forEach($scope.avaliados, function (item) {
                avaliadores.push(item);
            });

        }).error(function (data) {
            if (typeof data.error != "undefined" && data.error != "") {
                // Display an error toast, with a title
                //  toastr.error('Você deve está logado para acessar essa pagina', 'Erro faça login!');
                $location.path('login');
            } else {
                toastr.error('Erro ao buscar dados', 'Opss Erro!');
            }
        });

        event.preventDefault();
    }

    //Remover o avaliado
    $scope.removerAvalido = function (avaliado, avaliador) {
        var dados = {
            avalidado_id: avaliado.id,
            avalidador_id: avaliador
        };

        AvalicaoAPI.removerAvaliado(dados, parametros).success(function (data) {
            var index = $scope.avaliados.indexOf(avaliado);
            $scope.avaliados.splice(index, 1);
            toastr.success('Avaliador removido com sucesso', 'Dados Alterado');

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


    /*********************************************************************************
     * Aqui termina a parte de selecionar o avaliadores
     *********************************************************************************/


    /*****************************************************************************
     * Aqui começar a parte de selecionar a Competencia
     *********************************************************************************/
    $scope.reverseCompetencia = true;
    $scope.competencias = [];
    $scope.openCompetencia = function (id) {
        $scope.abreCompetencia = id;

        $scope.reverseCompetencia = !$scope.reverseCompetencia;
    };

    $scope.competenciasAvalicao = [];


    $scope.openModalCompetencia = function () {
        var ids = _.map($scope.competenciasAvalicao, 'id');
        var competencia = [];
        AvalicaoAPI.getCompetencia(ids).success(function (resposta) {
           competencia = resposta;

           competencia.ids = ids;

            modalInstanceCompetencia = $uibModal.open({

                animation: $scope.animationsEnabled,
                templateUrl: 'modalCompetencia.html',
                controller: 'ModalCompetenciaCtrl',
                resolve: {
                    items: function () {
                        return competencia;
                    }
                }
            });
            modalInstanceCompetencia.result.then(function (selectedItem) {
                compete = selectedItem;

                AvalicaoAPI.saveAvalicaoCompetencia(compete, parametros).success(function (data) {
                    $scope.competenciasAvalicao.push(compete);

                    ++$scope.totalItems;

                }).error(function () {
                    if (typeof data.error != "undefined" && data.error != "") {
                        // Display an error toast, with a title
                        toastr.error('Você deve está logado para acessar essa pagina', 'Erro faça login!');
                        $location.path('login');
                    } else {
                        toastr.error('Erro ao cadastrar os  dados', 'Opss Erro!');
                    }
                });


            }, function () {
                $log.info('Modal dismissed at: ' + new Date());
            });
        }).error(function (data) {
            if (typeof data.error != "undefined" && data.error != "") {
                // Display an error toast, with a title
                toastr.error('Você deve está logado para acessar essa pagina', 'Erro faça login!');
                $location.path('login');
            } else {
                toastr.error('Erro ao remover os  dados', 'Opss Erro!');
            }
        })
    };
    $scope.openDescriacao = [];
    $scope.doOpenDescricao = function (id) {
        //event.preventDefault();
        var index = $scope.openDescriacao.indexOf(id);

        if (index > -1) {
            $scope.openDescriacao.splice(index, 1);
        } else {
            AvalicaoAPI.getAvaliacaoComportamento([id]).success(function(data){
                var id = "";
                angular.forEach(data, function(valor) {
                    if(id != valor.competencia_id){
                        var competencias = competenciaSeleio(valor.competencia_id);
                        if(competencias){
                            var selecionado = data.filter(function (competencia) {
                                if (competencia.competencia_id  ==  valor.competencia_id) return competencia;
                            });
                            competencias[0].comportamento= selecionado;


                        }
                        id = valor.competencia_id;
                    }


                });
            })
            $scope.openDescriacao.push(id);
        }

    }
    function competenciaSeleio(valor){
        var selecionado = $scope.competenciasAvalicao.filter(function (competencia) {
            if (competencia.id  ==  valor) return competencia;
        });
        return selecionado;
    }
    $scope.openAllDescriacao = function () {


        if ($scope.openDescriacao.length > 0) {
            $scope.openDescriacao = [];
        } else {
            $scope.openDescriacao = _.map($scope.competenciasAvalicao, 'id');

            AvalicaoAPI.getAvaliacaoComportamento($scope.openDescriacao).success(function(data){
            var id = "";
                angular.forEach(data, function(valor) {
                    if(id != valor.competencia_id){
                        var competencias = competenciaSeleio(valor.competencia_id);
                            if(competencias){
                                var selecionado = data.filter(function (competencia) {
                                    if (competencia.competencia_id  ==  valor.competencia_id) return competencia;
                                });
                              competencias[0].comportamento= selecionado;


                            }
                        id = valor.competencia_id;
                    }


                });

            }).error(function(data){
                if (typeof data.error != "undefined" && data.error != "") {
                    // Display an error toast, with a title
                    toastr.error('Você deve está logado para acessar essa pagina', 'Erro faça login!');
                    $location.path('login');
                } else {
                    toastr.error('Erro ao buscar os  dados', 'Opss Erro!');
                }
            });


        }


    };
    $scope.BuscarCompetencia = function () {

        AvalicaoAPI.getAvaliacaoCompetencia(parametros).success(function(resposta) {
            $scope.sortFieldCompetenciaActive = 'competencias'
            $scope.reverseActive = false;

            $scope.competenciasAvalicao = resposta;
            /*
             $scope.currentPage = resposta;
            $scope.competenciasAvalicao = resposta.data;
            $scope.totalItems = resposta.total;

            console.log(resposta.current_page);
            $scope.numPages = resposta.per_page;
            $scope.bigTotalItems = resposta.per_page;
            $scope.last_page = resposta.last_page;
            */

        }).error(function (data) {
            if (typeof data.error != "undefined" && data.error != "") {
                // Display an error toast, with a title
                toastr.error('Você deve está logado para acessar essa pagina', 'Erro faça login!');
                $location.path('login');
            } else {
                toastr.error('Erro ao buscar os  dados', 'Opss Erro!');
            }
        });
    };
    //Checar todos
    $scope.checkAllCompetencia = function (competencias) {
        if ($scope.selectedAllCompetencia) {
            $scope.selectedAllCompetencia = false;
        } else {
            $scope.selectedAllCompetencia = true;
        }
        angular.forEach(competencias, function (competencia) {
            competencia.selecionado = $scope.selectedAllCompetencia;

        });

    };
    $scope.apagarCompetencia = function(){

    };
    $scope.sortFieldCompetenciaActive = 'nome';

    $scope.doSortCompetenciaAtive = function (event, coluna) {
        $scope.sortFieldCompetenciaActive = coluna
        $scope.reverseActive = !$scope.reverseActive;
        event.preventDefault();
    };
    $scope.openModalNova = function(){
        var modalInstance = $uibModal.open({
            animation: $scope.animationsEnabled,
            templateUrl: 'NovaCompetencia.html',
            controller: 'NovaCompetenciaCtrl',
            size: 'large',

        });

        modalInstance.result.then(function (selectedItem) {
            $scope.selected = selectedItem;
        }, function () {
            $log.info('Modal dismissed at: ' + new Date());
        });
    }
    /*
    $scope.setPage = function (pageNo) {
        console.log(pageNo);
        $scope.currentPage = pageNo;
    };
    $scope.pageChanged= function(){

        AvalicaoAPI.getCompetenciaAvalicaoPagination($scope.currentPage, parametros).success(function (resposta) {
          $scope.competenciasAvalicao = resposta.data;
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
    */



    /*********************************************************************************
     * Aqui termina a parte de selecionar a Competencia
     *********************************************************************************/


});
angular.module('app').controller('ModalCompetenciaCtrl', function ($scope, $uibModalInstance, items, $log, AvalicaoAPI) {
    $scope.sortFieldAvalidor = 'id';

    $scope.doSortCompetencia = function (event, coluna) {
        $scope.sortFieldCompetencia = coluna
        $scope.reverse = !$scope.reverse;

        event.preventDefault();
    };
    $scope.totalItems = items.total;
    $scope.currentPage = items.current_page;
    $scope.numPages = items.per_page;
    $scope.bigTotalItems = items.per_page;


    /*
     $scope.maxSize = 5;
     $scope.bigTotalItems = 175;
     $scope.bigCurrentPage = items.current_page;
     */

    $scope.items = items.data;
    $scope.selecionadoCompetencia = function (avaliador) {
        $uibModalInstance.close(avaliador);

    }
    $scope.setPage = function (pageNo) {
        $scope.currentPage = pageNo;
    };


    $scope.pageChanged = function () {

        AvalicaoAPI.getCompetenciaPagination($scope.currentPage, items.ids).success(function (resposta) {
            $scope.items = resposta.data;
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
    $scope.ok = function () {
        $uibModalInstance.close($scope.selected.item);
    };
    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };
});

angular.module('app').controller('ModalAvaliadoCtrl', function ($scope, $uibModalInstance, items) {
    $scope.sortFieldAvalidor = 'id';

    $scope.doSortAvaliador = function (event, coluna) {
        $scope.sortFieldAvalidor = coluna
        $scope.reverse = !$scope.reverse;

        event.preventDefault();
    };
    $scope.items = items;



    $scope.selecionadoAvaliador = function (competencia) {
        $uibModalInstance.close(competencia);

    }

    $scope.ok = function () {
        $uibModalInstance.close($scope.selected.item);
    };
    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };
});
angular.module('app').controller('NovaCompetenciaCtrl', function ($scope, $uibModalInstance, items) {
    $scope.sortFieldAvalidor = 'id';

    $scope.doSortAvaliador = function (event, coluna) {
        $scope.sortFieldAvalidor = coluna
        $scope.reverse = !$scope.reverse;

        event.preventDefault();
    };
    $scope.items = items;



    $scope.selecionadoCompetencia = function (competencia) {
        $uibModalInstance.close(competencia);

    }

    $scope.ok = function () {
        $uibModalInstance.close($scope.selected.item);
    };
    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };
});