class SessionsController < ApplicationController
  def new
    @title = 'Sign in'
    sign_out
  end
  
  def create
    user = User.authenticate(params[:session][:email] , params[:session][:password])
    flash.now[:error] = user.password
    if user.nil?
      flash.now[:error] = "Invalid mail/password"
      @title = "Sign in"
      render 'new'
    else
      sign_in user
      redirect_back_or user
      #redirect_to user
    end
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end
end
