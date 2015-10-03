app.controller 'PresentationCtrl', ($scope) ->

  $scope.message = "Stitch"
  $scope.newEvent = {}

  # fake user 
  $scope.user = {"name":  "Harry Styles", "dropboxToken":"xxx", "events" : [{"name":"HackZurich","date":"5th October"}, {"name":"HackNewZealand","date":"28th May"}]}	

  $scope.dropboxLogin = () ->
  	console.log "logging in with dropbox..."

  $scope.createEvent = () ->
  	console.log "new event created"
  	console.log $scope.newEvent
