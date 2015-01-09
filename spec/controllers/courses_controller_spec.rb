require 'rails_helper'

RSpec.describe Api::CoursesController, :type => :controller do
  it '#index should return two courses' do
    2.times { create :course }
    get :index
    json = JSON.parse(response.body)
    expect(json.count).to be 2
  end
  it '#create should create new course' do
    post :create, course: {
      code: 'CS123', name: 'Computer Science', max_enrollments: 3, start_date: '2014-01-01'
    }
    expect(Course.count).to be 1
  end
  it '#show should return course as json' do
    course = create(:course, name: 'Testing Show')
    get :show, id: course.id
    json = JSON.parse(response.body)
    expect(json['name']).to eq 'Testing Show'
  end
  it '#destroy should delete course' do
    course = create(:course)
    delete :destroy, id: course.id
    expect(Course.count).to be 0
  end
end
