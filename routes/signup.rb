class ELSWC < Sinatra::Application

  get "/signup" do
    if current_user
      redirect to("/")
    else
      @title = "Sign up"
      @user = User.new
      slim :hello_form
    end
  end

  post "/signup" do
    @user = User.new(
      username:              params[:username],
      display_name:          params[:display_name],
      email:                 params[:email],
      email_confirmation:    params[:email_confirmation],
      password:              params[:password],
      password_confirmation: params[:password_confirmation],
    )
    if @user.save
      @title = "Welcome!"
      slim :form
    else
      @title = "Sign up"
      slim :hello_form
    end
  end
end
