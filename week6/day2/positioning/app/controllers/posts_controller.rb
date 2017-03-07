class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
    @recent_posts = Post.where("id != ?", params[:id]).order(created_at: :desc).limit(5)
    render template: 'marketing/index.html.erb'
  end

  def index
    @posts = Post.order(created_at: :desc)
  end

end
