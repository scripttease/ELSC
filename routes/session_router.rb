require_relative "base_router"

class SessionRouter < BaseRouter

  get "/login" do
    if current_user
      redirect to "/"
    else
      @user = User.new
      @title = "Please enter your login details"
      slim :login
    end
  end
  
  post "/login" do
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to("/")
    else
      @title = "Please enter your login details"
      slim :login
    end
  end

  get "/logout" do
    if current_user
      session[:user_id] = nil
      redirect to("/")
    else
      redirect to("/login")
    end
  end
end
