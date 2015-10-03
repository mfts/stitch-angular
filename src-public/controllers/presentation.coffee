app.controller 'PresentationCtrl', ($scope) ->

  $scope.message = "Stitch"

  $scope.user = {"name":"Harry Styles", "dropboxToken":"xxx"}
  $scope.newEvent = {}	

  $scope.dropboxLogin = () ->
  	console.log "logging in with dropbox..."

  $scope.createEvent = () ->
  	console.log "new event created"
  	console.log $scope.newEvent
