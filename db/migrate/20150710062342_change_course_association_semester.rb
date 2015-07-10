class ChangeCourseAssociationSemester < ActiveRecord::Migration
  def change
  	change_column :course_associations, :semester, :integer,:limit => 2
  end
end
