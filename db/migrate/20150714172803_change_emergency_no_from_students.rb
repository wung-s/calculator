class ChangeEmergencyNoFromStudents < ActiveRecord::Migration
  def change
  	change_column :students, :emergency_no, :string, :limit => 20
  end
end
