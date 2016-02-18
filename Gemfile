# A Gemfile is responsible for specifying your project dependecies, so that anyone who uses your app will have the correct versions installed
# on their machine
source "https://rubygems.org"

# Micro web framework
gem "sinatra"

# Database Object relational mapper
# this provides a selection of methods, modules etc that allow us to interact
# with the database
gem "sinatra-activerecord"

# Adaptor for the SQLite database
gem "sqlite3"

# template language for joyous html replacement
gem "slim"

# removes everything from database after each test run and each individiual
# test in the test run
gem "database_cleaner"

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
  # Open the project in a REPL
  gem "racksh"
end
