require_relative "test_helper"

class PagesTest < TestCase
  include Rack::Test::Methods

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

  def test_route_profile
    get "/profile/:name"
    assert last_response.ok?
  end
  
  def test_route_users
    get "/:name"
    assert last_response.ok?
  end

  def test_route_id
    get "/#{name}/:id"
    assert last_response.ok?
  end
end
