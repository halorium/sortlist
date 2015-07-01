angular.module('app').controller("AgencyCtrl", [
  '$scope', 'AgencyService',
  ($scope, AgencyService) ->

    console.log 'AgencyCtrl running'

    init = ()->
      AgencyService.list().then((agencies) ->
        $scope.agencies = agencies
      )

      $scope.name_filter = ''
      $scope.tags_filter = ''

      $scope.new_agency = {
        name: '',
        description: '',
        tag_list: [],
        grade: ''
      }

    $scope.submitForm = ()->
      console.dir('submit new agency')
      data = { agency: {
        name: $scope.new_agency.name,
        description: $scope.new_agency.description,
        tag_list: $scope.new_agency.tag_list,
        grade: $scope.new_agency.grade
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
