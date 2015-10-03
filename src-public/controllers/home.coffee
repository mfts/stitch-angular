app.controller 'HomeCtrl', ($scope) ->

  $scope.message = "Stitch"

  $scope.dropboxLogin = () ->
  	console.log "logging in with dropbox..."
