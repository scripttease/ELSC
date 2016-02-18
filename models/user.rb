require "sinatra/activerecord"
require_relative "../app"

class User < ActiveRecord::Base
  validates_presence_of :name

end
