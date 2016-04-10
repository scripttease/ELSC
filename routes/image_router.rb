require_relative "base_router"

class ImageRouter < BaseRouter

  get '/' do
    @images = Image.all
    @title = "Welcome to ELSC"
    slim :"image/index"
  end

end
