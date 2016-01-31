require_relative "test_helper"

class PagesTest < MiniTest::Test
  include Rack::Test::Methods

  def app
    ELSWC
  end

  def test_hello_world
    assert_equal 1, 1
  end
  
  def test_route_home
    get "/"
    assert last_response.ok?
  end
  def test_route_about
    get "/about"
    assert last_response.ok?
  end
  def test_route_people
    get "/people"
    assert last_response.ok?
  end
  def test_route_terms_and_conditions
    get "/terms-and-conditions"
    assert last_response.ok?
  end
  def test_route_join
    get "/join"
    assert last_response.ok?
  end
  def test_route_contact
    get "/contact"
    assert last_response.ok?
  end
  def test_route_profile
    get "/profile/:name"
    assert last_response.ok?
  end
end
