app.controller 'HomeCtrl', ($scope, $state, $location, Dropbox, $window) ->

  $scope.message = "Stitch"

  $scope.keys = $window.localStorage

  $scope.dropboxLogin = () ->
    console.log "logging in with dropbox..."
    Dropbox.authenticate().then ->
        $state.reload() 
        $scope.present()
 
  $scope.present = () ->
    if $window.localStorage['dropbox-key'] != null
        accessToken = $window.localStorage['dropbox-key']
        alert(accessToken)
        $state.go('presentation', {})

