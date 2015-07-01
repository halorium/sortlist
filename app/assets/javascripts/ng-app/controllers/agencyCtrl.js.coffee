angular.module('app').controller("AgencyCtrl", [
  '$scope', 'AgencyService',
  ($scope, AgencyService) ->
    console.log 'AgencyCtrl running'

    AgencyService.list().then((agencies) ->
      $scope.agencies = agencies

      tags = []

      for agency in agencies
        tags = _.union(tags, agency.tag_list)

      $scope.tags = tags

      console.dir(tags)
      console.dir agencies
    )

    $scope.name_filter = ''
    $scope.tags_filter = ''
])
