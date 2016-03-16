angular.module("app").controller("LoginCtrl", function($scope, config, $http, $rootScope,$location,localStorageService){
    $scope.error = {
        valid:false,
        message:''
    };
    $scope.off = function(){
        $scope.error = {
            valid:false,
            message:''
        };
    }
    $scope.logo = config.baseUrl+"assets/img/conquist-cor.png";
    $scope.login = function(data){

        $http.post(config.baseUrl+'oauth/access_token',{

            username: data.email,
            password: data.password,
            client_id: config.client_id,
            client_secret: config.client_secret,
            grant_type: config.grant_type

        }).success(function(data){
           if(typeof data.access_token != "undefined" && data.access_token !=""){
               localStorageService.set('token', data.access_token);
               $location.path('dashboard');
           }

        }).error(function(data){
            $scope.error.valid = true;
            $scope.error.message = data.error_description;
        });
    }

});