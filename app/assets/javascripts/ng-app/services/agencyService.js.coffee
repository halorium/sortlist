angular.module('app').factory("AgencyService", [
  'Restangular', 'AgencyModel',
  (Restangular, AgencyModel)->
    console.log 'AgencyService running'

    model = 'agencies'

    Restangular.extendModel(model, (obj)->
      angular.extend(obj, AgencyModel)
    )

    list: ()-> Restangular.all('api/agencies').getList()
])
