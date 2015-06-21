class StaticPagesController < ApplicationController
	before_action :logged_in_user

  def home
  end

  def semester
  end

  def all
  end

  def genpdf
    @user = User.first
    respond_to do |format|
      format.html
      format.pdf do 
        pdf = UserPdf.new(@user)
        # pdf.text "hello world"
        #send_data pdf.render, filename: "test_file",
         #                     type: "application/pdf",
          #                    disposition: "attachment"
          send_data pdf.render
      end

    end
  end

  private 
  	def logged_in_user
  		unless logged_in?
  			flash[:danger] = "Please log in"
  			redirect_to root_url
  		end
  	end
end
