class Enrollment < ActiveRecord::Base
  belongs_to :course

  validates :course, :student_id, presence: true
  validates :course_id, uniqueness: { :scope => [ :student_id ] }
  validates :student_id, uniqueness: true

  validate :course_has_room


  def course_has_room
    errors.add(:course_id, 'course is full') unless course.nil? || course.enrollments.count < course.max_enrollments
  end
end
