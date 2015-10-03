app.controller 'PresentationCtrl', ($scope, $state, $window) ->

  $scope.message = "Stitch"
  $scope.newEvent = {}

  if $window.localStorage.length isnt 1 and $window.localStorage['dropbox-key'] isnt true
  	$state.go('home', {})


  # fake user 
  $scope.user = {"name":  "Harry Styles", "dropboxToken":"xxx", "events" : [{"name":"HackZurich","date":"5th October"}, {"name":"HackNewZealand","date":"28th May"}]}	

  $scope.dropboxLogin = () ->
  	console.log "logging in with dropbox..."

  $scope.createEvent = () ->
  	console.log "new event created"
  	console.log $scope.newEvent
