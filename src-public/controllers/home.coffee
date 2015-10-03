app.controller 'HomeCtrl', ($scope, Dropbox) ->

  $scope.message = "Stitch"

  $scope.dropboxLogin = () ->
  	console.log "logging in with dropbox..."
