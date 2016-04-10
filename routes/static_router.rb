require_relative "base_router"

class StaticRouter < BaseRouter

  get "/" do
    @title = "Welcome to ELSWC"
    slim :index
  end

  get "/about" do
    @title = "About ELSWC"
    slim :about
  end

end
