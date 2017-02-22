require_relative 'app'
require 'rack/test'
require 'minitest/autorun'
require 'minitest/pride'

class AppTest < Minitest::Test

  include Rack::Test::Methods

  def app
    App
  end

  def test_lipsums_endpoint
    get "/lipsums"
    assert last_response.ok?
    message = "Please pick between standard, samuel, and hipster"
    assert_equal message, last_response.body
  end

  def test_standard
    get "/standard"
    assert last_response.ok?
    assert_equal Standard.text, last_response.body
  end

  def test_hipster
    get "/hipster"
    assert last_response.ok?
    assert_equal Hipster.text, last_response.body
  end

  def test_samuel
    get "/samuel"
    assert last_response.ok?
    assert_equal Samuel.text, last_response.body
  end

end
