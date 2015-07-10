class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.integer :internal,:int4, :limit => 4
      t.integer :external, :limit => 4
      t.integer :total, :limit => 4
      t.string :grade, :limit => 10
      t.integer :credit_point, :limit => 4
      
      t.timestamps null: false
    end
  end
end
