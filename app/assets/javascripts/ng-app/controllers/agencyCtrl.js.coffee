angular.module('app').controller("AgencyCtrl", [
  '$scope', 'AgencyService',
  ($scope, AgencyService) ->

    console.log 'AgencyCtrl running'

    init = ()->
      AgencyService.list().then((agencies) ->
        $scope.agencies = agencies
      )

      $scope.nameFilter = ''
      $scope.tagsFilter = ''

      $scope.newAgency = {
        name: '',
        description: '',
        tag_list: [],
        grade: ''
      }

    $scope.submitForm = ()->
      console.dir('submit new agency')
      data = { agency: {
        name: $scope.newAgency.name,
        description: $scope.newAgency.description,
        tag_list: $scope.newAgency.tag_list,
        grade: $scope.newAgency.grade
      } }

      console.log(data)
      AgencyService.post(data).then(
        (agency) ->
          # update scope with new agency
          init()
        (error) ->
          console.log(error)
      )

    init()
])
