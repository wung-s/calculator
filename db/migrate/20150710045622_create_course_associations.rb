class CreateCourseAssociations < ActiveRecord::Migration
  def change
    create_table :course_associations do |t|
      t.integer :course_id
      t.integer :department_id
      t.integer :semester,:int4, :limit => 4
      t.integer :credit_hour, :limit => 4

      t.timestamps null: false
    end
    add_index :course_associations, :course_id
    add_index :course_associations, :department_id
    add_index :course_associations, [:course_id, :department_id], unique: true
  end
end
