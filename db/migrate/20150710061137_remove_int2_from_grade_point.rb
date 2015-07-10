class RemoveInt2FromGradePoint < ActiveRecord::Migration
  def change
    remove_column :grade_points, :int2, :integer
  end
end
