angular.module('enrollmentApp')
  .filter('studentIdToName', function() {
    return function(id, students) {
      var student = _.find(students, function(s) { return s.id === id });
      return student === undefined ? '' : student.name;
    };
  })
  .filter('courseIdToName', function() {
    return function(id, courses) {
      var course = _.find(courses, function(c) { return c.id === id });
      return course === undefined ? '' : course.name;
    };
  });
