app.controller 'PresentationCtrl', ($scope, $state, $window, Dropbox, Parse, Remember) ->

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
  	Dropbox.mkdir($scope.newEvent.name).then () ->
      parseRemember = new Remember
      parseRemember.oauth = localStorage['dropbox-key']
      parseRemember.folder_name = $scope.newEvent.name
      console.log "remember..."
      console.log parseRemember
      parseRemember.save().then (remember) ->
        console.log remember.objectId
  		$state.reload()

