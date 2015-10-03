app.controller 'PresentationCtrl', ($scope, $state, $window, Dropbox) ->

  $scope.message = "Stitch"
  $scope.newEvent = {}

  $scope.user = {}

  console.log localStorage['dropbox-key'] isnt null
  if localStorage['dropbox-key'] isnt null
    Dropbox.setCredentials({'access_token':localStorage['dropbox-key']})
    console.log Dropbox.credentials()
    console.log Dropbox.isAuthenticated()
    Dropbox.accountInfo().then (promisedUser) ->
      $scope.user = {
        name: promisedUser['display_name'],
        email: promisedUser['email']
      }

    Dropbox.readdir('/', null).then (promisedFolders) ->
      $scope.folders =  promisedFolders

  if $window.localStorage.length isnt 1 and $window.localStorage['dropbox-key'] isnt true
  	$state.go('home', {})

  $scope.dropboxLogin = () ->
  	console.log "logging in with dropbox..."


  $scope.createEvent = () ->
  	console.log "new event created"
  	console.log $scope.newEvent
