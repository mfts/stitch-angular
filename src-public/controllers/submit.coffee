app.controller 'SubmitCtrl', ($scope, $state, $window, Dropbox, Parse, Remember) ->
  $scope.message = "Stitch"
  $scope.folder = {name: 'HackZurich'}

  objectId = "XL8zHYdlVd"

  # get folder from parameter in link
  getFolder = () ->
  	console.log "getting folder..."
  	Remember.find(objectId).then (remember) ->
  		$scope.remember = remember
  		console.log $scope.remember
  $scope.$on('$viewContentLoaded', getFolder)

