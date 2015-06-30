angular.module('app').controller("AgencyCtrl", [
  '$scope', 'AgencyService',
  ($scope, AgencyService) ->
    console.log 'AgencyCtrl running'

    AgencyService.list().then((agencies) ->
      $scope.agencies = agencies
      console.dir agencies
    )

    $scope.exampleValue = "Hello angular and rails"

])
