angular.module('enrollmentApp').controller('Course.index', function($scope, $resource, Course) {

  $scope.loadCourses = function() {
    Course.query({}, function(data) {
      $scope.courses = data;
    });
  }

  $scope.destroyCourse = function(id) {
    Course.remove({ id: id }, function(data) {
      _.remove($scope.courses, function(c) { return c.id === id; });
    });
  };

  $scope.addCourse = function() {
    Course.save($scope.course, function(data) {
      $scope.course = { code: '', name: '', max_enrollments: 0, start_date: ''};

      $scope.courses.push(data);
    });
  }

  $scope.loadCourses();
});
