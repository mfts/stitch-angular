# *********************
# ALL MODAL CONTROLLERS
# *********************

# Report Info Modal
# -----------------
app.controller 'FinalizeCtrl', ($scope, $modalInstance, subfolders) ->
    # UI elements
    $scope.message = "breeze"
    $scope.lines = subfolders
    $scope.executeMessage = "S-T-IT--CH"

    $scope.cancel = () ->
        $modalInstance.dismiss('cancel')

    $scope.execute = () ->
        $modalInstance.close(subfolders)