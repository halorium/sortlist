angular.module('app.sortlistApp').controller("AgenciesCtrl", [
  '$scope',
  ($scope)->
    console.log 'AgenciesCtrl running'

    $scope.exampleValue = "Hello angular and rails"

])
