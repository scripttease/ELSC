require_relative "base_router"

class MainRouter < BaseRouter

  get "/" do
    @title = "Welcome to ELSC"
    slim :index
  end

  get "/about" do
    @title = "About ELSC"
    slim :about
  end

end
