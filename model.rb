require "sinatra/activerecord"
require_relative "./app"

class User < ActiveRecord::Base
  validates_presence_of :name

#  user = User.new do |u|
#    u.name = "Louis"
#  end
#
end
