require 'rails_helper'

RSpec.describe Api::EnrollmentsController, :type => :controller do
  it '#index should return two enrollments' do
    2.times { create :enrollment }
    get :index
    json = JSON.parse(response.body)
    expect(json.count).to be 2
  end
  it '#index should only return enrollments for specified course' do
    course1 = create :course 
    2.times { create :enrollment, course: course1 }
    course2 = create :course
    3.times { create :enrollment, course: course2 }

    get :index, course_id: course2.id

    json = JSON.parse(response.body)
    expect(json.count).to be 3
  end
  it '#create should create enrollment' do
    course = create :course
    post :create, enrollment: { course_id: course.id, student_id: 'JONO' }
    expect(Course.count).to be 1
  end
  it '#destroy should destroy enrollment' do
    enrollment = create :enrollment
    delete :destroy, id: enrollment.id
    expect(Enrollment.count).to be 0
  end
end
