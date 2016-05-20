# Issues
## Issue 1
I am still not seeing errors in my stacktrace :(
## Issue 2
From User List page clicking on display_name will not redirect to the user's page because it is using username. Need to validate display_name so it is a valid url OR need to change views and routes. Which is best?
## Issue 3
Do I have security issues now that all validation fields will allow nil?
## Issue 4
CSS for layout view is not correct - should be a dropdown menu
## Issue 5
Are tests that use User.new actually failing to create a user?
## Issue 6
Test test_profile-updated is failing
## Issue 7
Failed tests do not give errors (Failed test no message given)
## Issue 8
Test test_sessions_enabled is not written
## Issue 9
Creating a test user in test_helper.rb doesn't work
# Notes
# Code I deleted
## In routes/user_router.rb
```ruby
    
  patch "/profile/edit" do
    @user = current_user
    if current_user && current_user.authenticate(params[:password])
    #@display_name = current_user.display_name
    # @user.update_attribute:display_name, @display_name 
    # @user.update_attributes(display_name: params[:display_name])
    #@user.save!
```
I created @display_name to pass to update_attribute because it wouldnt accept params[:display_name] and I was using update_attribute to bypass validation because update_attributes had failed due to my validations. However, update_attribute still failed at validation because the second save (user.save) failed? (although if this is the case then why was the record not changed in the database from the first save? Answer, it was but the second save caused a rollback so it was removed.) 

## In routes/base_router.rb
```ruby

  # set :raise_errors, false
  
  # set :show_exceptions, true if development?
  
  # configure :development do
  #   disable :show_exceptions
  #   enable :dump_errors,:raise_errors
  #   use Rack::ShowExceptions
  # end

  # $exception = Sinatra::ShowExceptions.new(self)
  # error do 
  #   @error = env['sinatra_error']
  #   @error_message = $exception.pretty(env,@error)
  # end
```
## In views/not_found.slim
```Ruby

p This happened: #{@error_message}
```

This was all because I couldn't see errors in my stacktrace and I wanted to either print them in the html body or show them in the stacktrace but none of it seemed to work.
