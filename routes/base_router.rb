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
  #set :show_exceptions, true if development?
  #set :raise_errors, false

  helpers do
    def current_user
      if session[:user_id]
        @current_user ||= User.find_by(id: session[:user_id])
      end
    end
  end

  configure :development do
    disable :show_exceptions
    enable :dump_errors,:raise_errors
    use Rack::ShowExceptions
  end

  $exception = Sinatra::ShowExceptions.new(self)
  error do 
    @error = env['sinatra_error']
    @error_message = $exception.pretty(env,@error)
  end
end
