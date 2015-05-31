class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :role

      t.timestamps null: false

      #add_index :users, :email, unique: true
    end
  end
end
