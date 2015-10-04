app.controller 'SubmitCtrl', ($scope, $state, $location, $window, Dropbox, Parse, Remember, fileUpload) ->
  $scope.message = "Stitch"

  comps = $location.absUrl().split('?')
  if comps.length == 2
    console.log comps
    objectId = comps[1]
  else
    objectId = ""
  # get folder from parameter in link
  getFolder = () ->
  	#console.log "getting folder..."
  	Remember.find(objectId).then (remember) ->
  		$scope.remember = remember
  		console.log $scope.remember
  $scope.$on('$viewContentLoaded', getFolder)

  $scope.upload = () ->
    file = $scope.myFile
    console.log file
    r = $scope.remember
    uploadUrl = "https://stitcher.scapp.io/submit/#{r.oauth}/#{r.folder_name}/#{file.name}"
    console.log uploadUrl
    fileUpload.uploadFileToUrl(file, uploadUrl)

