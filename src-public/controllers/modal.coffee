# *********************
# ALL MODAL CONTROLLERS
# *********************

# Report Info Modal
# -----------------
app.controller 'FinalizeCtrl', ($scope, $modalInstance, folder, subfolders, Remember) ->
    # UI elements
    
    subfolders = (f.substring(folder.length+1) for f in subfolders)

    $scope.message = "when all the files are here, arrange them in order and hit stitch!" #folder.substring(1)
    $scope.lines = subfolders
    $scope.executeMessage = "S-T-IT--CH"

    $scope.cancel = () ->
        $modalInstance.dismiss('cancel')

    $scope.execute = () ->
        ordered_files = subfolders
        name = folder.substring(1)
        Remember.query({'where':{'folder_name':name}}).then (remember) ->
          console.log remember[0]
          remember = remember[0]
          data = {oauth: remember.oauth, folder: remember.folder_name}
          console.log "https://stitcher.scapp.io/stitch/#{data.oauth}/#{data.folder}/#{ordered_files.toString()}/"
          $http.jsonp("https://stitcher.scapp.io/stitch/#{data.oauth}/#{data.folder}/#{ordered_files.toString()}/")
            .success (data, status, headers, config) ->
              console.log "success"
              $state.reload()
        $modalInstance.close($scope.message, $scope.lines)