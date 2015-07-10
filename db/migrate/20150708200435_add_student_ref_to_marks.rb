class AddStudentRefToMarks < ActiveRecord::Migration
  def change
    add_reference :marks, :student, index: true
    add_foreign_key :marks, :students
  end
end
