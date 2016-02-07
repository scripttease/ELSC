require "sinatra/base"
require "tilt/erb"
require "sinatra/activerecord"
require "slim"
require_relative "./model"

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
    slim :user
  end

  get "/signup" do
    @title = params[:title]
    #@users = User.new
    slim :hello_form, locals: { title: "Sign up!" }
  end

  post "/signup" do
    @title    = "Sign up"
    @username = params[:username] || "blank username"
    @password = params[:password] || "blank password"
    slim :form
  end

  get '/users/:slug' do
    @user  = User.find_by(slug: params[:slug])
    @title = "Welcome to ELSWC",
    if @user
      slim :show
    else
      status 404
      slim :not_found
    end
  end
end
