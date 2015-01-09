class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :code
      t.string :name
      t.date :start_date
      t.integer :max_enrollements

      t.timestamps null: false
    end
  end
end
