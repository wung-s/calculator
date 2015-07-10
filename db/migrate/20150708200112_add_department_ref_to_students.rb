class AddDepartmentRefToStudents < ActiveRecord::Migration
  def change
    add_reference :students, :department, index: true
    add_foreign_key :students, :departments
  end
end
