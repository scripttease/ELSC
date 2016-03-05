require_relative "test_helper"

class UsersTest < TestCase
  include Rack::Test::Methods

  def test_images_index
    testlouis = User.create!(
      display_name: "Louis", 
      username: "testlouis",
      email: "testlouis.pil@mail.com",
      password: "foobar1",
      password_confirmation: "foobar1"

    )
    Image.create!(
      image_url: "/images/image1.jpg", 
      comment: "test", 
      user: testlouis)
    get "/images"
    assert last_response.ok?
  end
end
