FactoryGirl.define do
  sequence :course_code do |n|
    "CS#{n}"
  end

  sequence :student_id do |n|
    "STUD#{n}"
  end

  factory :course do
    name 'Software Development'
    code { generate :course_code }
    start_date Date.today
    max_enrollments 6
  end

  factory :enrollment do
    course
    student_id
  end
end
