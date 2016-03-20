require "sinatra/base"
require "tilt/erb"
require "sinatra/activerecord"
require "slim"
require "pry"
require_relative "../models/user"
require_relative "../models/image"

class BaseRouter < Sinatra::Application
  enable :sessions

  register Sinatra::ActiveRecordExtension
  set :database_file, "../config/database.yml"
  set :views, "./views"

  helpers do
    def current_user
      if session[:user_id]
        @current_user ||= User.find_by(id: session[:user_id])
      end
    end
  end

end
