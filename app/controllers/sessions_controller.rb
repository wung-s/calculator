class SessionsController < ApplicationController
  def new

  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase);
  	if user  && user.authenticate(params[:session][:password])
  		#render successfull
  		log_in user
  		redirect_to controller: 'static_pages', action: 'semester'
  		flash.now[:success] = 'Validation successfull'
  	else
  		flash.now[:danger] = 'Login Failed!'
  		render 'new'
  	end
  end 

  def destroy
  	log_out
  	flash[:info] = "You have been logged out successfully"
  	redirect_to root_url
  end

end
