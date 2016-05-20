ENV["RACK_ENV"] = "test"
require "minitest/autorun"
require "minitest/pride"
require "rack/test"
require "sinatra/activerecord"
require "database_cleaner"

DatabaseCleaner.strategy = :transaction
DatabaseCleaner.clean_with(:truncation)

class TestCase < Minitest::Test
  def app
    ELSC
  end

  def current_user
    binding.pry
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def test_user
    @test_user = User.create!(
      display_name: "testuser", 
      username: "testuser", 
      email: "test@user.com",
      email_confirmation: "test@user.com",
      password: "foobar1",
      password_confirmation: "foobar1"
    )
  end

  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end
end

require_relative "../app"
