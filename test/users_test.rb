require_relative "test_helper"

class UsersTest < TestCase
  include Rack::Test::Methods

  def test_users_show_route
    User.create!(name: "Alice", slug: "alice")
    get "/users/alice"
    assert last_response.ok?
    assert last_response.body.include? "Profile for Alice"
  end

  def test_users_show_for_unknown_user
    get "/users/alice"
    assert_equal 404, last_response.status
    assert last_response.body.include? "Page not found"
  end
end
