require 'rubygems'
require 'bundler/setup'
ENV['RACK_ENV'] = 'test'

require_relative 'first_app'
require 'test/unit'
require 'rack/test'
require 'faker'

require './test_connection'

class FirstAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_the_index
    get '/'
    assert last_response.ok?
    result = {'message' => 'Hello World'}
    assert_equal result, JSON.parse(last_response.body)
  end

  def test_names_page
    name = Faker::Name.first_name
    get "/#{name}"
    assert last_response.ok?
    result = {'message' => "Hi there, #{name}"}
    assert_equal result, JSON.parse(last_response.body)
  end

  def test_lipsums_page
    Lorem.where("title != NULL").each do |ipsum|
      get "/lorem/#{ipsum.title}"
      assert last_response.ok?
      check = {"title" => ipsum.title, "body" => ipsum.body}
      assert_equal check, JSON.parse(last_response.body)
    end
    # TODO: Fill me in to check each lipsum you support.
  end

  def test_creating_a_lorem
    post "/lorem/new",
      {
        name: "namegoeshere",
        paragraph: "text goes here"
      }
    assert last_response.ok?
    check = {"title" => "namegoeshere", "body" => "text goes here"}
    assert_equal check, JSON.parse(last_response.body)
  end

  def test_an_improper_lorem
    post "/lorem/new",
      {
        paragraph: "text goes here"
      }
    refute last_response.ok?
    check = {"code" => 400, "message" => "Title can't be blank"}
    assert_equal check, JSON.parse(last_response.body)
  end


end
