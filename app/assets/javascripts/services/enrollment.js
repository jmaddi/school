angular.module('enrollmentApp').service('Enrollment', function($resource) {
  return $resource('/api/enrollments/:id');
});
