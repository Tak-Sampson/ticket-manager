class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(email: params[:email]).first
    if user && user.authenticate(params[:password])
      flash[:notice] = 'Welcome back!'
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = 'Invalid email or password. Please try again'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You have successfully logged out'
    redirect_to root_path
  end
end