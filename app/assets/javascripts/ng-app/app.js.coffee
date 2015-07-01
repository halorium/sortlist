@app = angular.module('app', [
  'templates',
  'ui.router',
  'restangular'
])

@app.config([
  '$httpProvider', ($httpProvider) ->
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])

@app.config([
  '$stateProvider',
  '$urlRouterProvider',
  '$locationProvider',
  ($stateProvider, $urlRouterProvider, $locationProvider) ->

    $stateProvider
      .state('agencies', {
        url: '/',
        templateUrl: 'agencies.html',
        controller: 'AgencyCtrl'
      })

    $urlRouterProvider.otherwise('/');

    $locationProvider.html5Mode({
      enabled: true
    });

])

@app.run(->
  console.log 'angular app running'
)
