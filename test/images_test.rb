require_relative "test_helper"

class UsersTest < TestCase
  include Rack::Test::Methods

  def test_images_index
    Image.create!(image_url: "/images/image1.jpg", comment: "test")
    get "/images"
    assert last_response.ok?
  end
end
