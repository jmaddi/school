require 'rails_helper'

RSpec.describe Enrollment, :type => :model do
  it 'should require student_id' do
    enrollment = build(:enrollment, student_id: nil)
    expect(enrollment.valid?).to be false
  end
  it 'should require course_id' do
    enrollment = build(:enrollment, course_id: nil)
    expect(enrollment.valid?).to be false
  end
  it 'should validate course_id' do
    enrollment = build(:enrollment, course_id: 1337)
    expect(enrollment.valid?).to be false
  end
  it 'should not allow duplicate enrollments for a course/student' do
    course = create(:course)
    create(:enrollment, course: course, student_id: 'testduplicate')
    enrollment = build(:enrollment, course: course, student_id: 'testduplicate')
    expect(enrollment.valid?).to be false
  end
  it 'should not allow more than max_enrollments enrollments' do
    course = create(:course, max_enrollments: 4)
    4.times do 
      create(:enrollment, course: course)
    end
    enrollment = build(:enrollment, course: course)
    expect(enrollment.valid?).to be false
  end
  it 'should not allow a student to enroll in more than one course' do
    create(:enrollment, student_id: 'keenstudent')
    enrollment = build(:enrollment, student_id: 'keenstudent')
    expect(enrollment.valid?).to be false
  end
end
