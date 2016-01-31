ENV["RACK_ENV"] = "test"
require "minitest/autorun"
require "minitest/pride"
require "rack/test"
require "sinatra/activerecord"
require "database_cleaner"

DatabaseCleaner.strategy = :transaction

class TestCase < Minitest::Test
  def app
    ELSWC
  end

  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end
end

require_relative "../app"
