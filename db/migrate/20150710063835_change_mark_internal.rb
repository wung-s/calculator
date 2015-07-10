class ChangeMarkInternal < ActiveRecord::Migration
  def change
  	change_column :marks, :internal, :integer,:limit => 4
  end
end
