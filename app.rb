require "sinatra/base"
require "tilt/erb"
require "sinatra/activerecord"
require "slim"
require_relative "./model"

class ELSWC < Sinatra::Application
  #include ActionView::Helpers::UrlHelper
  register Sinatra::ActiveRecordExtension
  set :database_file, "config/database.yml"

  get "/" do
    @title = params[:title]
    slim :index, locals: { title: "Welcome to ELSWC" }
  end

  get "/about" do
    @title = params[:title]
    slim :about, locals: { title: "About ELSWC" }
  end

  get "/profile/:name" do
    @title = params[:title]
    @name = params[:name]
    slim :profile, locals: { title: "Hello #{@name.capitalize}" }
  end

  get '/users' do
    @title = params[:title]
    @users = User.all
    slim :user, locals: { title: "Welcome to ELSWC" }
 
  end

  get '/users/:id' do
    @title = params[:title]
    @users = User.find(params[:id])
    slim :show, locals: { title: "Welcome to ELSWC" }
 
  end
  
  get "/signup" do
    @title = params[:title]
    #@users = User.new
    slim :hello_form, locals: { title: "Sign up!" }
  end

  post "/signup" do
    @title = params[:title]
    username = params[:username] || "blank username"
    password = params[:password] || "blank password"

    slim :form, :locals => {"username" => username, "password" => password, "title" => "Sign up" } 
  end

end
