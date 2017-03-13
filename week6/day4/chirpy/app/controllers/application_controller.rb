class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :load_popular_users

  private

  def load_popular_users
    if params[:controller] == "users" && params[:action] == "show"
      starter = User.where("id != ?", params[:id])
    else
      starter = User.all
    end
    @popular_users ||= starter.order(followers_count: :desc).limit(4)
  end

end
