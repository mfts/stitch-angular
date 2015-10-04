app.controller 'CreateCtrl', ($scope, $state, $window, $http, $modal, Dropbox, Parse, Remember) ->

  $scope.message = "Stitch"
  $scope.newEvent = {}

  $scope.user = {}
  $scope.folders = []
  $scope.ids = []

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
      # $scope.folders = promisedFolders
      testfolders = promisedFolders
      for each in testfolders
        if each.substring(1) != '_stitched'
          console.log "pushing #{each}"
          $scope.folders.push(each)

      Remember.query().then (remember) ->
        count = 0
        for fold in $scope.folders
          console.log fold.substring(1)
          console.log remember[count].folder_name
          for rem in remember
            if fold.substring(1) is rem.folder_name
              $scope.ids[rem.folder_name] = rem.objectId
          count += 1

  if $window.localStorage.length isnt 1 and $window.localStorage['dropbox-key'] isnt true
    $state.go('home', {})

  $scope.dropboxLogin = () ->
    console.log "logging in with dropbox..."


  $scope.logout = () ->
    $window.localStorage.clear()
    $state.reload()
      

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
    Dropbox.readdir(folder, null).then (promisedFolders) ->
      console.log promisedFolders
      modalInstance = $modal.open(
        animation: true,
        templateUrl: 'messageModal.html',
        controller: 'FinalizeCtrl'
        resolve:
          folder: () ->
            return folder
          subfolders: () ->
            return promisedFolders
          Remember: () ->
            return Remember
      )
      modalInstance.result
         .then (name, ordered_files) ->
            # rematch rushees if report has been submitted
            alert "we're stitching your files. They'll be ready soon in a folder named '_stitched' in your dropbox folder"


