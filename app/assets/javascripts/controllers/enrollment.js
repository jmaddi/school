angular.module('enrollmentApp').controller('Enrollment', function($scope) {

  $scope.setCurrentController = function(controller) {
    $scope.current_controller = controller;
  }

  $scope.isCurrentController = function(controller) {
    return $scope.current_controller === controller;
  }

});
