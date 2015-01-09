var enrollementApp = angular.module('enrollmentApp', ['ngRoute', 'ngResource', 'ngAnimate', 'angular-datepicker']);

enrollementApp.config(function($routeProvider, $httpProvider, $locationProvider) {
  authToken = $("meta[name=\"csrf-token\"]").attr("content");
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken;
  $locationProvider.html5Mode(true)

  $routeProvider.
    when('/courses', {
      templateUrl: '/assets/partials/courses_index.html',
      controller: 'Course.index'
    }).
    when('/students', {
      templateUrl: '/assets/partials/students_index.html',
      controller: 'Student.index'
    }).

    when('/courses/:id', {
      templateUrl: '/assets/partials/courses_show.html',
      controller: 'Course.show'
    }).
    otherwise({
      redirectTo: '/courses'
    });
});
