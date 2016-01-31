# A Gemfile is responsible for specifying your project dependecies, so 
# that anyone who uses your app will have the correct versions installed 
# on their machine
source "https://rubygems.org"

# Micro web framework
gem "sinatra"

group :development do
  # Reload the application automatically in dev
  gem "shotgun"
end

group :development, :test do
  # Ruby make task runner
  gem "rake"
  # Test framework
  gem "minitest"
  # Rack web app test helpers
  gem "rack-test"
end
