angular.module('enrollmentApp').service('Student', function($resource) {
  return $resource('/api/students', {}, { query: { cache: true, isArray: true }});
});
