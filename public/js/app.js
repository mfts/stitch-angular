'use strict';
var app;

app = angular.module('angularParseBoilerplate', ['ng', 'ngResource', 'ui.router', 'ui.bootstrap', 'app.templates', 'Parse', 'angulartics', 'angulartics.google.analytics', 'dropbox']);

app.config(function($locationProvider, $stateProvider, $urlRouterProvider, ParseProvider, DropboxProvider) {
  $locationProvider.hashPrefix('!');
  $stateProvider.state('task', {
    url: '/task',
    controller: 'TaskCtrl',
    templateUrl: 'task.html'
  }).state('home', {
    url: '/home',
    controller: 'HomeCtrl',
    templateUrl: 'home.html'
  }).state('presentation', {
    url: '/presentation',
    controller: 'PresentationCtrl',
    templateUrl: 'presentation.html',
    params: []
  });
  $urlRouterProvider.otherwise('/home');
  ParseProvider.initialize("xw3annraVDvaHU4TfnW5kYV2i8EKX1ZTG8vM1CJ5", "HnPumKf2pJ4OI733IlIBSwibZKu7NbmcrBWUkAjy");
  return DropboxProvider.config("tz764utcclnkf06", "http://localhost:8008/callback.html");
});

app.run(function($rootScope, $state) {
  return $rootScope.$state = $state;
});

app.controller('HomeCtrl', function($scope, $state, $location, Dropbox, $window) {
  $scope.message = "Stitch";
  $scope.keys = $window.localStorage;
  $scope.dropboxLogin = function() {
    console.log("logging in with dropbox...");
    return Dropbox.authenticate().then(function() {
      $state.reload();
      return $scope.present();
    });
  };
  return $scope.present = function() {
    var accessToken;
    if ($window.localStorage['dropbox-key'] !== null) {
      accessToken = $window.localStorage['dropbox-key'];
      return $state.go('presentation', {});
    }
  };
});

app.controller('PresentationCtrl', function($scope, $state, $window, Dropbox) {
  $scope.message = "Stitch";
  $scope.newEvent = {};
  $scope.user = {};
  console.log(localStorage['dropbox-key'] !== null);
  if (localStorage['dropbox-key'] !== null) {
    Dropbox.setCredentials({
      'access_token': localStorage['dropbox-key']
    });
    console.log(Dropbox.credentials());
    console.log(Dropbox.isAuthenticated());
    Dropbox.accountInfo().then(function(promisedUser) {
      return $scope.user = {
        name: promisedUser['display_name'],
        email: promisedUser['email']
      };
    });
  }
  if ($window.localStorage.length !== 1 && $window.localStorage['dropbox-key'] !== true) {
    $state.go('home', {});
  }
  $scope.dropboxLogin = function() {
    return console.log("logging in with dropbox...");
  };
  return $scope.createEvent = function() {
    console.log("new event created");
    return console.log($scope.newEvent);
  };
});

var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

app.factory('Task', function(Parse) {
  var Task;
  return Task = (function(_super) {
    __extends(Task, _super);

    function Task() {
      return Task.__super__.constructor.apply(this, arguments);
    }

    Task.configure("Task", "title");

    return Task;

  })(Parse.Model);
});
