class StudentsController < ApplicationController
	#before_action :logged_in_user

	def index 
		 
		# @students = Student.page(params[:page]).per_page(2)
		 # debugger
		 @students = Student.paginate(page: params[:page], per_page: 4)
		
	end
									 
	def create
		# render plain: 'ok'
		@student = Student.new(student_params)
		# debugger
	#	render plain: params[:student][:first_name] and return
		if @student.save
			@students = Student.paginate(page: params[:page], per_page: 4)
			flash.now[:success] = "Registration successful"
			# redirect_to '/students'
			render action: 'index'
		else 
			flash.now[:danger] = "Registration unsuccessful"
			render 'new'
		end
	end

	def new 
		@student = Student.new
	end

	def show

	end

	def edit
		 @student = Student.find(params[:id])
		# debugger
	end

	private
		def student_params
			params.require(:student).permit(:first_name, :middle_name, :last_name, :address, :email, :state, :pincode, :emergency_no, :department_id)
		end

end
