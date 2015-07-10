class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :regno, :limit => 50
      t.string :first_name, :limit => 50
      t.string :middle_name, :limit => 50
      t.string :last_name, :limit => 50
      t.string :email, :limit => 50
      t.text :address, :limit => 500
      t.string :state, :limit => 50
      t.integer :pincode
      t.integer :emergency_no

      t.timestamps null: false
    end
  end
end
