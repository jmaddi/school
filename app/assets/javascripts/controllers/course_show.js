angular.module('enrollmentApp').controller('Course.show', function($scope, Student, Course, Enrollment, $routeParams) {

  $scope.enrollment = { course_id: $routeParams.id };

  $scope.loadStudents = function() {
    Student.query(function(data) {
      $scope.students = data;
    });
  }

  $scope.loadCourse = function() {
    Course.get({id: $routeParams.id}, function(data) {
      $scope.course = data;
    });
  }

  $scope.loadEnrollments = function() {
    Enrollment.query({course_id: $routeParams.id}, function(data) {
      $scope.enrollments = data;
    });
  }

  $scope.destroyEnrollment = function(id) {
    Enrollment.remove({ id: id }, function(data) {
      _.remove($scope.enrollments, function(e) { return e.id == id });
    });
  }

  $scope.addStudent = function() {
    Enrollment.save($scope.enrollment, function(data) {
      $scope.enrollments.push(data);
    });
  }

  $scope.loadStudents();
  $scope.loadCourse();
  $scope.loadEnrollments();
});
