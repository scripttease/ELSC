require "sinatra/base"
require "tilt/erb"
require "sinatra/activerecord"
require "slim"

class ELSWC < Sinatra::Application
  register Sinatra::ActiveRecordExtension
  set :database_file, "config/database.yml"

  get "/" do
    slim :index, locals: { title: "Welcome to ELSWC" }
  end

  get "/profile/:name" do
    name = params[:name]
    slim :profile, locals: { title: "Hello #{name.capitalize}" }
  end

end
