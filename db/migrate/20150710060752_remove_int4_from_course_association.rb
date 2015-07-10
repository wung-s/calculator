class RemoveInt4FromCourseAssociation < ActiveRecord::Migration
  def change
    remove_column :course_associations, :int4, :integer
  end
end
