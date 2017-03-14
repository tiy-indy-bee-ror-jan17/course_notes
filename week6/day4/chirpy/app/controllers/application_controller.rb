class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :load_popular_users

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    unless current_user
      flash[:warning] = "You need to be logged in to do this."
      redirect_to login_path
    end
  end


  def load_popular_users
    if params[:controller] == "users" && params[:action] == "show"
      starter = User.where("id != ?", params[:id])
    else
      starter = User.all
    end
    @popular_users ||= starter.order(followers_count: :desc).limit(4)
  end

end
