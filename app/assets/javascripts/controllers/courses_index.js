angular.module('enrollmentApp').controller('Course.index', function($scope, $resource, Course) {

  $scope.loadCourses = function() {
    Course.index({}, function(data) {
      console.debug(data);
      $scope.courses = data;
    });
  }

  $scope.removeEmployee = function(id) {
    Course.destroy(id).success(function() {
      _.remove($scope.employees, function(e) { return e.id === id; });
    });
  };

  $scope.addEmployee = function() {
    Employee.createEmployee({
      employee: {
        name: $scope.name,
        email: $scope.email,
        password: $scope.password,
        password_confirmation: $scope.password,
      }
    }).success(function(data) {
      $scope.name     = '';
      $scope.email    = '';
      $scope.password = '';

      $scope.employees.push(data);
    });
  }

  $scope.loadCourses();
});
