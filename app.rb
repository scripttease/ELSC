require "sinatra/base"
require "tilt/erb"
require "sinatra/activerecord"
require "slim"
require_relative "./model"

class ELSWC < Sinatra::Application
  register Sinatra::ActiveRecordExtension
  set :database_file, "config/database.yml"

  get "/" do
    slim :index, locals: { title: "Welcome to ELSWC" }
  end

  get "/about" do
    slim :about, locals: { title: "About ELSWC" }
  end

  get "/profile/:name" do
    name = params[:name]
    slim :profile, locals: { title: "Hello #{name.capitalize}" }
  end

  get '/users' do
    @users = User.all
    slim :user, locals: { title: "Welcome to ELSWC" }
 
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    slim :show, locals: { title: "Welcome to ELSWC" }
 
  end

end
