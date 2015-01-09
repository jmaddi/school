class RenameEnrollementsInCourses < ActiveRecord::Migration
  def change
    rename_column :courses, :max_enrollements, :max_enrollments
  end
end
