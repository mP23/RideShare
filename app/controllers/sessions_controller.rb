class SessionsController < ApplicationController
  def new
    
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    elsif (params[:session][:email] = "" || params[:session][:password] = "")
      flash[:danger] = 'One or more of the text fields are blank'
      render 'new'
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    
  end
  
end
