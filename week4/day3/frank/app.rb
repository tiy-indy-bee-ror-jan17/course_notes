require 'bundler/setup'
require 'sinatra'
require 'sqlite3'
require 'active_record'
require_relative 'standard'
require_relative 'samuel'
require_relative 'hipster'
require_relative 'post'

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "development.sqlite3"
)

get "/" do
  "Hello World!"
end

get "/lipsums" do
  "Please pick between standard, samuel, and hipster"
end

get "/current_time" do
  Time.now.strftime("%A, %d %b %Y %l:%M %p")
end

get "/not_found" do
  status 404
  "That ain't here"
end

get "/posts" do
  posts = Post.all
  puts posts.class
  posts.to_json
end

get "/posts/:id" do
  post = Post.find(params[:id])
  "#{post.title}: #{post.body}"
end

get "/:lipsum/?:num?" do
  if %w(standard hipster samuel).include? params[:lipsum]
    Object.const_get(params[:lipsum].capitalize).call(params[:num])
  else
    redirect "/not_found"
  end
end

post "/posts" do
  post = Post.new(params)
  if post.save
    "#{post.title}: #{post.body}"
  else
    status 400
    post.errors.full_messages.join("\n")
  end
end

put "/posts/:id" do
  post = Post.find(params[:id])
  if post.update(title: params[:title], body: params[:body])
    "#{post.title}: #{post.body}"
  else
    status 400
    post.errors.full_messages.join("\n")
  end
end

delete "/posts/:id" do
  post = Post.find(params[:id])
  post.destroy
  "This post has joined the choir invisible"
end
