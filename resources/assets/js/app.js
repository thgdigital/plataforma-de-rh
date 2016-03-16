/**
 * Created by albertovieira on 8/11/15.
 */
var app = angular.module('app', ['ngRoute']);

app.config(function ($routeProvider) {

    // For any unmatched url, redirect to /state1
   // 
   $routeProvider.when("/perfil", {
        templateUrl: 'views/editar-empresa.html',
        controller:"OrganizacaoCtrl"

   }).when("/dashboard", {
        templateUrl: 'views/dashboard.html'
        
   }).when("/login", {
        templateUrl: 'views/login.html'
        
   });
   $routeProvider.otherwise("dashboard");
    // Now set up the states
    /*
    $stateProvider
        .state('dashboard', {
            url: "/dashboard",
            views: {
                "": { templateUrl: "views/dashboard.html" }
                //"viewB": { template: "index.viewB" }
            }
        })
        .state('item01', {
            url: '/item01',
            templateUrl: 'views/item01.html'
        })
        .state('item02', {
            url: '/item02',
            templateUrl: 'views/item02.html'
        })
        .state('perfil', {
            url: '/perfil',
            templateUrl: 'views/editar-empresa.html',

        })
*/
});
