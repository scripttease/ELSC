require_relative "test_helper"

class UsersTest < TestCase
  include Rack::Test::Methods

  def test_users_show_route
    User.create!(display_name: "Alice", username: "alice")
    get "/users/alice"
    assert last_response.ok?
    assert last_response.body.include? "Profile for Alice"
  end

  def test_users_show_for_unknown_user
    get "/users/alice"
    assert_equal 404, last_response.status
    assert last_response.body.include? "Page not found"
  end

  def test_users_index
    User.create!(display_name: "Alice", username: "alice")
    User.create!(display_name: "Louis", username: "louis")
    get "/users"
    assert last_response.ok?
    assert last_response.body.include? "Alice"
    assert last_response.body.include? "Louis"
  end

  def test_user_images_list
    louis = User.create!(display_name: "Louis", username: "louis")
    image = Image.create!(
      image_url: "/images/image1.jpg",
      comment: "test",
      user: louis,
    )
    get "/users/louis"
    assert last_response.ok?
    assert last_response.body.include? image.image_url
  end

  def test_user_with_no_images
    User.create!(display_name: "Alice", username: "alice")
    louis = User.create!(display_name: "Louis", username: "louis")
    image = Image.create!(
      image_url: "/images/image1.jpg",
      comment: "test",
      user: louis,
    )
    get "/users/alice"
    assert last_response.ok?
    refute last_response.body.include? image.image_url
  end

end
