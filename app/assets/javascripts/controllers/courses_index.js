angular.module('enrollmentApp').controller('Course.index', function($scope, $resource, Course, $window) {

  $scope.setCurrentController('course');

  $scope.loadCourses = function() {
    Course.query({}, function(data) {
      $scope.courses = data;
    });
  }

  $scope.destroyCourse = function(id) {
    var confirmed = $window.confirm('Are you sure?');
    if (confirmed) {
      Course.remove({ id: id }, function(data) {
        _.remove($scope.courses, function(c) { return c.id === id; });
      });
    }
  };

  $scope.addCourse = function() {
    Course.save($scope.course, function(data) {
      $scope.course = { code: '', name: '', max_enrollments: 0, start_date: ''};

      $scope.courses.push(data);
    }, function(error) {
      _.each(error.data.errors, function(e) {
        noty({text: e, theme: 'relax', layout: 'topCenter', type: 'error', timeout: 3000});
      });
    });
  }

  $scope.loadCourses();
});
