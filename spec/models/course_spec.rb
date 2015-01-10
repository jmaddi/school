require 'rails_helper'

RSpec.describe Course, :type => :model do
  it 'should not allow course without name' do
    course = build(:course, name: nil)
    expect(course.valid?).to be false
  end
  it 'should not allow course without code' do
    course = build(:course, code: nil)
    expect(course.valid?).to be false
  end
  it 'should not allow course without start date' do
    course = build(:course, start_date: nil)
    expect(course.valid?).to be false
  end
  it 'should not allow course without max enrollments' do
    course = build(:course, max_enrollments: nil)
    expect(course.valid?).to be false
  end
  it 'should not allow multiple coures with same code' do
    create(:course, code: 'CS101')
    duplicate = build(:course, code: 'CS101')
    expect(duplicate.valid?).to be false
  end
  it 'should delete enrollments on destroy' do
    course = create(:course)
    3.times { create(:enrollment, course: course) }
    expect(Enrollment.count).to be 3
    course.destroy
    expect(Enrollment.count).to be 0
  end
end
