require_relative "base_router"

class ImageRouter < BaseRouter

  get '/' do
    @images = Image.all
    @title = "Welcome to ELSWC"
    slim :"image/index"
  end
 
end
