angular.module('enrollmentApp').service('Course', function($resource) {
  return $resource('/api/courses/:id', null);
});
