angular.module('enrollmentApp').service('Course', function($resource) {
  return $resource('/api/courses/:id', null, {
    index: { method: 'GET', isArray: false }
  });
});
