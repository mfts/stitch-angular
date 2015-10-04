'use strict'

app = angular.module 'angularParseBoilerplate', [
  'ng'
  'ngResource'
  'ui.router'
  'ui.bootstrap'
  'ui.sortable'
  'app.templates'
  'Parse'
  'angulartics'
  'angulartics.google.analytics'
  'dropbox'
]

app.config (
  $locationProvider
  $stateProvider
  $urlRouterProvider
  ParseProvider
  DropboxProvider
) ->

  $locationProvider.hashPrefix '!'

  $stateProvider
  .state 'task',
    url: '/task'
    controller: 'TaskCtrl'
    templateUrl: 'task.html'
  .state 'home',
    url: '/home'
    controller: 'HomeCtrl'
    templateUrl: 'home.html'
  .state 'create',
    url: '/create'
    controller: 'CreateCtrl'
    templateUrl: 'create.html'
    params: []
  .state 'submit',
    url: '/submit'
    controller: 'SubmitCtrl'
    templateUrl: 'submit.html'
    params: []

  $urlRouterProvider.otherwise '/home'

  ParseProvider.initialize(
    "xw3annraVDvaHU4TfnW5kYV2i8EKX1ZTG8vM1CJ5", # Application ID
    "HnPumKf2pJ4OI733IlIBSwibZKu7NbmcrBWUkAjy"  # REST API Key
  )

  DropboxProvider.config("tz764utcclnkf06", "http://localhost:8008/callback.html")

app.run ($rootScope, $state) ->
  $rootScope.$state = $state

# // for file selection
`app.directive('fileModel', ['$parse', function ($parse) {
    return {
        restrict: 'A',
        link: function(scope, element, attrs) {
            var model = $parse(attrs.fileModel);
            var modelSetter = model.assign;
            
            element.bind('change', function(){
                scope.$apply(function(){
                    modelSetter(scope, element[0].files[0]);
                });
            });
        }
    };
}]);`
# // for file upload
`app.service('fileUpload', ['$http', function ($http) {
    this.uploadFileToUrl = function(file, uploadUrl){
        var fd = new FormData();
        fd.append('file', file);
        $http.post(uploadUrl, fd, {
            transformRequest: angular.identity,
            headers: {'Content-Type': undefined}
        })
        .success(function(){
        })
        .error(function(){
        });
    }
}]);`