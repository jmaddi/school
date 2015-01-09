angular.module('enrollmentApp').controller('Student.index', function($scope, Student, Course, Enrollment) {

  $scope.loadStudents = function() {
    Student.query(function(data) {
      $scope.students = data;
    });
  }

  $scope.loadCourses = function() {
    Course.query(function(data) {
      $scope.courses = data;
    });
  }

  $scope.loadEnrollments = function() {
    Enrollment.query(function(data) {
      $scope.enrollments = data;
    });
  }

  $scope.addEnrollment = function() {
    Enrollment.save($scope.enrollment, function(data) {
      $scope.enrollments.push(data);
    });
  }

  $scope.destroyEnrollment = function(id) {
    Enrollment.remove({ id: id }, function(data) {
      _.remove($scope.enrollments, function(e) { return e.id == id });
    });
  }

  $scope.loadStudents();
  $scope.loadCourses();
  $scope.loadEnrollments();
});
