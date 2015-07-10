class Student < ActiveRecord::Base
	belongs_to :department
	has_many :marks, dependent: :destroy
end
