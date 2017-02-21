require 'minitest/autorun'
require 'minitest/pride'
require "rack/test"
require_relative 'app'

class TestThing < Minitest::Test

  include Rack::Test::Methods

  def app
    App
  end

  def test_say_name
    get "/hey/billy"
    p last_response
    assert last_response.ok?
    assert_equal "Hello, Billy", last_response.body
  end

  def test_a_404
    get "/serghy45jt65ed"
    refute last_response.ok?
    assert_equal 404, last_response.status
    assert_equal "That ain't here", last_response.body
  end

  def test_env_output
    get "/env"
    assert last_response.ok?
    assert_equal "{", last_response.body[0]
    assert_equal "}", last_response.body[-1]
  end

  def test_google_rejection
    header "User-Agent", "Googlebot"
    get "/env"
    refute last_response.ok?
    assert_equal "Go away, Google", last_response.body
  end

  def test_less_specific_google_rejection
    header "User-Agent", "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"
    get "/env"
    refute last_response.ok?
    assert_equal "Go away, Google", last_response.body
  end

  def test_a_post
    post "/poster", 'field1' => "Hey", 'field2' => "ya'll"
    p last_request
    assert last_response.ok?
    assert_equal "Hey ya'll", last_response.body
  end

end
