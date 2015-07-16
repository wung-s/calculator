class RemoveStateFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :state, :string
  end
end
