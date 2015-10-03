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
    templateUrl: 'presentation.html'
  });
  $urlRouterProvider.otherwise('/home');
  ParseProvider.initialize("xw3annraVDvaHU4TfnW5kYV2i8EKX1ZTG8vM1CJ5", "HnPumKf2pJ4OI733IlIBSwibZKu7NbmcrBWUkAjy");
  return DropboxProvider.config("tz764utcclnkf06", "http://localhost:8008/callback.html");
});

app.run(function($rootScope, $state) {
  return $rootScope.$state = $state;
});

app.controller('HomeCtrl', function($scope, Dropbox) {
  $scope.message = "Stitch";
  return $scope.dropboxLogin = function() {
    console.log("logging in with dropbox...");
    return Dropbox.authenticate();
  };
});

app.controller('PresentationCtrl', function($scope) {
  $scope.message = "Stitch";
  $scope.newEvent = {};
  $scope.user = {
    "name": "Harry Styles",
    "dropboxToken": "xxx",
    "events": [
      {
        "name": "HackZurich",
        "date": "5th October"
      }, {
        "name": "HackNewZealand",
        "date": "28th May"
      }
    ]
  };
  $scope.dropboxLogin = function() {
    return console.log("logging in with dropbox...");
  };
  return $scope.createEvent = function() {
    console.log("new event created");
    return console.log($scope.newEvent);
  };
});

app.controller('TaskCtrl', function($scope) {});

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
