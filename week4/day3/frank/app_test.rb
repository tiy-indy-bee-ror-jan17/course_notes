require_relative 'app'
require 'rack/test'
require 'minitest/autorun'
require 'minitest/pride'
require 'faker'

class AppTest < Minitest::Test

  include Rack::Test::Methods

  def app
    Sinatra::Application
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

  def test_poster
    post "/posts",
      {title: Faker::RickAndMorty.quote, body: "Wha?"}
    assert last_response.ok?
  end

  def test_posts_list
    get "/posts"
    assert last_response.ok?
  end

  def test_posts_show
    post = Post.last
    get "/posts/#{post.id}"
    assert last_response.ok?
    body = "#{post.title}: #{post.body}"
    assert_equal body, last_response.body
  end

  def test_post_put
    post = Post.last
    new_title = Faker::RickAndMorty.quote
    put "/posts/#{post.id}",
      {title: new_title}
    assert last_response.ok?
    body = "#{new_title}: #{post.body}"
    assert_equal body, last_response.body
  end

  def test_post_destroy
    post = Post.last
    pre_count = Post.count
    delete "/posts/#{post.id}"
    assert last_response.ok?
    assert_equal pre_count - 1, Post.count
    refute Post.find_by(id: post.id)
  end

end
