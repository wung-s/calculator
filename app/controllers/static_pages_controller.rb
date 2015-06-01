class StaticPagesController < ApplicationController
	before_action :logged_in_user

  def home
  end

  def semester
  end

  def all
  end

  private 
  	def logged_in_user
  		unless logged_in?
  			flash[:danger] = "Please log in"
  			redirect_to root_url
  		end
  	end
end
