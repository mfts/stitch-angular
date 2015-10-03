app.controller 'CreateCtrl', ($scope, $state, $window, $http, $modal, Dropbox, Parse, Remember) ->

  $scope.message = "Stitch"
  $scope.newEvent = {}

  $scope.user = {}
  $scope.folders = []

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


  $scope.logout = () ->
    $window.localStorage.clear()
    $state.reload()
  
  $scope.getId = (folder) ->
    console.log folder
    # Remember.query({'where':{'folder_name':folder.substring(1)}}).then (object) ->
      # return object.objectId

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
        console.log "saved"
        console.log remember
      $state.reload()

  $scope.finalizeModal = (folder) ->
    $scope.currentFolder = folder
    modalInstance = $modal.open(
      animation: true,
      templateUrl: 'messageModal.html',
      controller: 'FinalizeCtrl'
      resolve:
        subfolders: () ->
          return folder
    )
    modalInstance.result
       .then () ->
          # rematch rushees if report has been submitted
          $scope.finalize($scope.currentFolder)


  $scope.finalize = (name) ->
    name = name.substring(1)
    Remember.query({'where':{'folder_name':name}}).then (remember) ->
      console.log remember[0]
      remember = remember[0]
      data = {oauth: remember.oauth, folder: remember.folder_name}
      console.log "https://stitcher.scapp.io/stitch/#{data.oauth}/#{data.folder}"
      $http.jsonp("https://stitcher.scapp.io/stitch/#{data.oauth}/#{data.folder}")
        .success (data, status, headers, config) ->
          console.log "success"
          $state.reload()


