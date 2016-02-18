require "sinatra/activerecord"
require_relative "../app"

class User < ActiveRecord::Base
  has_many :images
  validates_presence_of :name

end
