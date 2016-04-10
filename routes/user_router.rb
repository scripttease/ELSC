require_relative "base_router"

class UserRouter < BaseRouter

  get '/' do
    @users = User.all
    @title = "Welcome to ELSC"
    slim :"user/index"
  end

  get '/:username' do
      @title = "Welcome to ELSC"
      @user  = User.find_by(username: params[:username])
    if current_user == @user
      if @user
        slim :"user/show"
      else
        redirect to("/")
      end
    else
      status 404
      slim :not_found
    end
  end

end
