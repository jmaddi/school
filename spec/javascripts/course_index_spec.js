describe('Course.index', function() {
  beforeEach(module('enrollmentApp'));
  
  var $controller, $httpBackend;

  var mockCourse = jasmine.createSpyObj('mockCourse', ['query', 'remove', 'save']);
  var mockWindow = { confirm: function() { return true } };

  beforeEach(inject(function(_$controller_) {
    $controller = _$controller_;
  }));

  var $scope, controller;

  beforeEach(function() {
    $scope = {};
    $scope.setCurrentController = jasmine.createSpy('setCurrentController');
    controller = $controller('Course.index', { $scope: $scope, Course: mockCourse, $window: mockWindow });
  });


  it('should load courses', function() {
    expect(mockCourse.query).toHaveBeenCalled();
  });

  it('addCourse should save course', function() {
    $scope.addCourse(5);
    expect(mockCourse.save).toHaveBeenCalled();
  });

  it('destroyCourse should remove course', function() {
    $scope.destroyCourse(5);
    expect(mockCourse.remove).toHaveBeenCalled();
  });

});
