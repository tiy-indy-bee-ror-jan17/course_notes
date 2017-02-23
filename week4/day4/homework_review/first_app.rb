require 'sinatra'
require './lorem'
require 'puma'
require 'rabl'
require 'active_support/core_ext'
require 'active_support/inflector'
require 'builder'
require 'ostruct'
configure { set :server, :puma }
Rabl.configure do |config|
  config.include_json_root = false
  config.include_child_root = false

end
Rabl.register!

get "/" do
  @message = OpenStruct.new({message: "Hello World"})
  # params.inspect
  rabl :message
end

get "/:name" do
  @message = OpenStruct.new({message: "Hi there, #{params[:name]}"})
  rabl :message
  # params.inspect
end

get "/lorem/:type" do
  # find the lipsum requested
  @lipsum = Lorem.find_by(title: params[:type])
  # if it's found
  if @lipsum
    rabl :lipsum
    # render said ipsum
  else
    status 404
    @error = OpenStruct.new({code: 404, message: "Not found"})
    rabl :error
  end
    # render 404
end

post "/lorem/new" do
  # params.inspect
  # Take the data sent and make a new Lorem
  @lipsum = Lorem.new(
    title: params[:name],
    body: params[:paragraph]
  )
  # If it saves
  if @lipsum.save
    rabl :lipsum
  # render something
  else
  # render an error
    status 400
    @error = OpenStruct.new({code: 400, message: @lipsum.errors.full_messages.first})
    rabl :error
  end
end

after do
  ActiveRecord::Base.clear_active_connections!
end
