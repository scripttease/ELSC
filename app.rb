require "sinatra/base"
require "tilt/erb"
require "sinatra/activerecord"
require "slim"
require_relative "./models/user"
require_relative "./models/image"

class ELSWC < Sinatra::Application
  register Sinatra::ActiveRecordExtension
  set :database_file, "config/database.yml"

  get "/" do
    @title = "Welcome to ELSWC"
    slim :index
  end

  get "/about" do
    @title = "About ELSWC"
    slim :about
  end

  get "/profile/:name" do
    @name = params[:name].capitalize
    slim :profile
  end

  get '/users' do
    @users = User.all
    @title = "Welcome to ELSWC"
    slim :"user/index"
  end

  get "/signup" do
    @title = params[:title]
    slim :hello_form, locals: { title: "Sign up!" }
  end

  post "/signup" do
    @title    = "Sign up"
    @username = params[:username] || "blank username"
    @password = params[:password] || "blank password"
    slim :form
  end

  get '/users/:slug' do
    @title = "Welcome to ELSWC"
    @user  = User.find_by(slug: params[:slug])
    if @user
      slim :"user/show"
    else
      status 404
      slim :not_found
    end
  end
  
  get '/images' do
    @images = Image.all
    @title = "Welcome to ELSWC"
    slim :"image/index"
  end
end
