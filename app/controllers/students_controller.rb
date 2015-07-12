class StudentsController < ApplicationController
	#before_action :logged_in_user

	def index 

	end

	def create
		# render plain: 'ok'
		@student = Student.new(student_params)
		# debugger
	#	render plain: params[:student][:first_name] and return
		if @student.save
			flash.now[:success] = "Registration successful"
			render 'list_all'
		else 
			render 'new'
		end
	end

	def new 
		@student = Student.new
	end

	private
		def student_params
			params.require(:student).permit(:first_name, :middle_name, :last_name, :address, :email, :state, :pincode, :emergency_no, :department_id)
		end

end
