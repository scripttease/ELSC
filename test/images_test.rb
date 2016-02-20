require_relative "test_helper"

class UsersTest < TestCase
  include Rack::Test::Methods

  def test_images_index
    louis = User.create!(name: "Louis", slug: "louis")
    Image.create!(image_url: "/images/image1.jpg", comment: "test", user: louis)
    get "/images"
    assert last_response.ok?
  end
end
