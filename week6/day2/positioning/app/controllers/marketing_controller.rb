class MarketingController < ApplicationController

  def index
    @post = Post.order(created_at: :desc).first
    @recent_posts = Post.order(created_at: :desc).offset(1).limit(5) 
  end

end
