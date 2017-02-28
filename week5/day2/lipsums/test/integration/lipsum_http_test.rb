require 'test_helper'

class LipsumHTTPTest < ActionDispatch::IntegrationTest

  test "it should create a lipsum" do
    hash = {
      slug: "Sluggy",
      body: "The missing person in Clue"
    }
    post "/lipsums",
      params: hash
    assert response.ok?
    json = JSON.parse(response.body)
    assert_equal hash[:slug], json["slug"]
  end

end
