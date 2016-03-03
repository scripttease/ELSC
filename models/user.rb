require "sinatra/activerecord"
require_relative "../app"

class User < ActiveRecord::Base
  has_many :images
  validates(
    :username,  presence: true, 
                length: { maximum: 50 },
                format: { with: /\A[a-z0-9-]+\z/},  #slug or URL type
                uniqueness: true
           )
  

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates(:email,   presence: true, 
                      length: { maximum: 255 }, 
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: true
           )
end
