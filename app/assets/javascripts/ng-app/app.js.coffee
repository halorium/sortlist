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
      .state('home', {
        url: '/',
        templateUrl: 'home.html',
        controller: 'HomeCtrl'
      })
      .state('agencies', {
        url: '/agencies',
        templateUrl: 'agencies.html',
        controller: 'AgencyCtrl'
      })
      .state('dashboard', {
        abstract: true,
        url: '/dashboard',
        templateUrl: 'dashboard/layout.html'
      })
      .state('dashboard.one', {
        url: '',
        templateUrl: 'dashboard/one.html'
      })
      .state('dashboard.two', {
        url: '/two',
        templateUrl: 'dashboard/two.html'
      })
      .state('dashboard.three', {
        url: '/three',
        templateUrl: 'dashboard/three.html'
      });

    $urlRouterProvider.otherwise('/');

    $locationProvider.html5Mode({
      enabled: true
    });

])

@app.run(->
  console.log 'angular app running'
)
