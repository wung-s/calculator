class CreateGradePoints < ActiveRecord::Migration
  def change
    create_table :grade_points do |t|
      t.string :grade, :limit => 10
      t.integer :point,:int2, :limit => 2

      t.timestamps null: false
    end
  end
end
