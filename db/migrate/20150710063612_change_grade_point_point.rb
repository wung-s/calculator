class ChangeGradePointPoint < ActiveRecord::Migration
  def change
  	change_column :grade_points, :point, :integer,:limit => 2
  end
end
