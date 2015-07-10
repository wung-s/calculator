class AddCourseRefToMarks < ActiveRecord::Migration
  def change
    add_reference :marks, :course, index: true
    add_foreign_key :marks, :courses
  end
end
