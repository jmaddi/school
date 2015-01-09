angular.module('enrollmentApp').controller('Student.index', function($scope) {

  $scope.loadStudents = function() {
    Student.index().success(function(data) {
      $scope.courses = data;
    });
  }
  //$scope.loadCourses();
});
