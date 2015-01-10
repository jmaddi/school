angular.module('enrollmentApp').controller('Student.index', function($scope, Student, Course, Enrollment, $window) {

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
    }, function(error) {
      _.each(error.data.errors, function(e) {
        noty({text: e, theme: 'relax', layout: 'topCenter', type: 'error', timeout: 3000});
      });
    });
  }

  $scope.destroyEnrollment = function(id) {
    var confirmed = $window.confirm('Are you sure?');
    if (confirmed) {
      Enrollment.remove({ id: id }, function(data) {
        _.remove($scope.enrollments, function(e) { return e.id == id });
      });
    }
  }

  $scope.loadStudents();
  $scope.loadCourses();
  $scope.loadEnrollments();
});
