class UsersController < ApplicationController
  before_action :logged_in_user

  def new
  end

  def show
  	@user = User.find(params[:id])
  	#debugger
  end

  private
  	def logged_in_user
  		unless logged_in?
  			flash[:danger] = "Please log in"
  			redirect_to root_url
  		end
  	end
end
