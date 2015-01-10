class Course < ActiveRecord::Base
  has_many :enrollments

  validates :name, :code, :start_date, :max_enrollments, presence: true
  validates :code, uniqueness: true

  validates :max_enrollments, numericality: { greater_than_or_equal_to: 0 }
end
