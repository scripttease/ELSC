require_relative "base_router"

class UserRouter < BaseRouter

  get '/' do
    @users = User.all
    @title = "Welcome to ELSC"
    slim :"user/index"
  end

  get '/profile' do
    if current_user
      @user = current_user
      slim :"profile"
    else
      @title = "Please enter your login details"
      slim :login
    end
  end

  get '/:username' do
      @title = "Welcome to ELSC"
      @user  = User.find_by(username: params[:username])
    if @user
      if current_user == @user
        slim :"profile"
      else
        slim :"user/show"
      end
    else
      status 404
      slim :not_found
    end
  end

  get '/profile/edit' do
    if current_user
      @user = current_user
      slim :"user/edit"
    else
      @title = "Please enter your login details"
      slim :login
    end
  end

  patch "/profile/edit" do
    @user = current_user
    @display_name = current_user.display_name
    if current_user && current_user.authenticate(params[:password])
      @user.update_attribute:display_name, @display_name 
      #@user.update_attributes(display_name: params[:display_name])
      @user.save!
      if @user.save
        @title = "You have updated your profile"
        slim :"profile"
      else
        @title = "life is ashes"
        @user.errors.messages.inspect
        slim :"not_found"
      end
    else
      @title = "Please check that you entered the correct password" 
      slim :"users/profile/edit"
    end
  end
end

# do i need to not use .new or am i then creating a new entry? what about using .update? How about display_name.update? How do i see errors/debug? can't remember the pry thing :(
