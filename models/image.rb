require "sinatra/activerecord"
require_relative "../app"

class Image < ActiveRecord::Base
  belongs_to :user

end
