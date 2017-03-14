class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.username}!"
      redirect_to :root
    else
      flash[:danger] = "Incorrect credentials. Please try again."
      redirect_to :login
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end

end
