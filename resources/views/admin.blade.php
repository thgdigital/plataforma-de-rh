<!DOCTYPE html>
<html ng-app="app">
<head>
    <meta charset="UTF-8">
    <title>ConQuist</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="shortcut icon" href="{{ asset('/assets/img/favicon.png') }}">
    <!-- Bootstrap 3.3.4 -->
    <link href="{{ asset("/assets/css/bootstrap.min.css") }}" rel="stylesheet" type="text/css"/>
    <!-- Font Awesome Icons -->
    <link href="{{ asset("/assets/css/font-awesome.min.css") }}" rel="stylesheet" type="text/css"/>
    <!-- Ionicons -->
    <link href="{{ asset("/assets/css/ionicons.min.css") }}" rel="stylesheet" type="text/css"/>
    <!-- Theme style -->
    <link href="{{ asset("/assets/css/AdminLTE.min.css")}}" rel="stylesheet" type="text/css"/>
    <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
          page. However, you can choose any other skin. Make sure you
          apply the skin class to the body tag so the changes take effect.
    -->
    <link href="{{ asset("assets/css/skins/skin-blue.css") }}" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="{{ asset("assets/plugins/iCheck/square/blue.css")}}">

    <link href="{{ asset("/assets/css/toastr.css")}}" rel="stylesheet"/>
    <link href="{{ asset("/assets/css/ui-bootstrap-csp.css")}}" rel="stylesheet"/>
    <link href="{{ asset("/assets/css/loading-bar.css")}}" rel="stylesheet"/>
    <link href="{{ asset("/assets/css/app.css")}}" rel="stylesheet" type="text/css"/>
</head>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
skin-blue sidebar-mini sidebar-collapse

|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body class="skin-blue sidebar-mini">


    <!-- Content Wrapper. Contains page content -->
    <div ng-view></div>


<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 2.1.4 -->
<script src="{{ asset ("/assets/js/jquery.min.js") }}"></script>
<!-- AngularJS -->
<script src="{{ asset ("/assets/js/angular.min.js") }}"></script>
<script src="{{ asset ("/assets/js/angular-locale_pt-br.js") }}"></script>
<script src="{{ asset ("/assets/js/angular-route.min.js") }}"></script>
<script src="{{ asset ("/assets/js/moment.js") }}"></script>
<script src="{{ asset ("/assets/js/angular-moment.js") }}"></script>
<script src="{{ asset ("/assets/js/ng-wig.js") }}"></script>



<!--<script src="{{ asset ("/assets/js/angular-ui-router.min.js") }}"></script>-->
<!-- Bootstrap 3.3.2 JS -->
<script src="{{ asset ("/assets/js/bootstrap.min.js") }}"></script>
<script src="{{ asset ("/assets/js/ui-bootstrap-tpls.js") }}"></script>
<script src="{{ asset ("/assets/js/loading-bar.js") }}"></script>
<!-- AdminLTE App -->
<script>
    var AdminLTEOptions = {
        //Enable sidebar expand on hover effect for sidebar mini
        //This option is forced to true if both the fixed layout and sidebar mini
        //are used together
        sidebarExpandOnHover: true
    };
</script>
<script src="{{ asset ("/assets/js/app-jquery.js") }}"></script>
<script src="{{ asset ("/assets/js/jquery.mask.min.js") }}"></script>
<script src="{{ asset ("/assets/plugins/iCheck/icheck.min.js") }}"></script>
<script src="{{ asset ("/assets/js/toastr.js") }}"></script>
<script src="{{ asset ("/assets/js/lodash.core.js") }}"></script>
<script src="{{ asset ("/assets/js/angular-local-storage.js") }}"></script>
<script src="{{ asset ("/assets/js/app.js") }}"></script>
<script src="{{ asset ("/assets/js/organizacaoCtrl.js") }}"></script>
<script src="{{ asset ("/assets/js/departamentoCtrl.js") }}"></script>
<script src="{{ asset ("/assets/js/editarDepartamentoCtrl.js") }}"></script>
<script src="{{ asset ("/assets/js/editarCargoCtrl.js") }}"></script>
<script src="{{ asset ("/assets/js/cargosCtrl.js") }}"></script>
<script src="{{ asset ("/assets/js/novoCargosCtrl.js") }}"></script>
<script src="{{ asset ("/assets/js/cargosColaboradorCtrl.js") }}"></script>
<script src="{{ asset ("/assets/js/colaboradoresCtrl.js") }}"></script>
<script src="{{ asset ("/assets/js/avalicoesDadosCtrl.js") }}"></script>
<script src="{{ asset ("/assets/js/avalicoesCtrl.js") }}"></script>
<script src="{{ asset ("/assets/js/LoginCtrl.js") }}"></script>
<script src="{{ asset ("/assets/js/listarAvalicaoCtrl.js") }}"></script>
<script src="{{ asset ("/assets/js/competenciaCtrl.js") }}"></script>
<script src="{{ asset ("/assets/js/competenciaEditarCtrl.js") }}"></script>
<script src="{{ asset ("/assets/js/competenciaComportamentoCtrl.js") }}"></script>
<script src="{{ asset ("/assets/js/editarComportamentoCtrl.js") }}"></script>
<script src="{{ asset ("/assets/js/services/organizacaoAPIService.js") }}"></script>
<script src="{{ asset ("/assets/js/services/userAPIService.js") }}"></script>
<script src="{{ asset ("/assets/js/services/departamentoAPIService.js") }}"></script>
<script src="{{ asset ("/assets/js/services/cargoAPIService.js") }}"></script>
<script src="{{ asset ("/assets/js/services/avalicaoAPIService.js") }}"></script>
<script src="{{ asset ("/assets/js/services/competenciaAPIService.js") }}"></script>
<script src="{{ asset ("/assets/js/confiValue.js") }}"></script>
<script src="{{ asset ("/assets/js/directiva/phoneDirect.js") }}"></script>
<script src="{{ asset ("/assets/js/directiva/icheckDirect.js") }}"></script>
    <script>
      $(function () {
        $('input').iCheck({
          checkboxClass: 'icheckbox_square-blue',
          radioClass: 'iradio_square-blue',
          increaseArea: '20%' // optional
        });
      });
    </script>
</body>
</html>
