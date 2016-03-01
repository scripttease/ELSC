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
    get "/profile/:display_name"
    assert last_response.ok?
  end
end
