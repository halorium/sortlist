angular.module('app').controller("HomeCtrl", [
  '$scope', 'AgencyService', ($scope, AgencyService) ->
    console.log 'HomeCtrl running'

    $scope.exampleValue = "Hello angular and rails";
    $scope.things = ['Angular', 'Rails 4.1', 'UI Router', 'Together!!'];
])
