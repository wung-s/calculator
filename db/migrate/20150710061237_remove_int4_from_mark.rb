class RemoveInt4FromMark < ActiveRecord::Migration
  def change
    remove_column :marks, :int4, :integer
  end
end
