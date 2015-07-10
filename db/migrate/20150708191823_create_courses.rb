class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :code,:limit => 50
      t.string :name,:limit => 100

      t.timestamps null: false
    end
  end
end
