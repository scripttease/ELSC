require "sinatra/activerecord"
require_relative "../app"

class User < ActiveRecord::Base
  has_secure_password

  before_save { self.email = email.downcase }

  has_many :images

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates(
    :email,   
    presence: true, 
    length: { maximum: 255 }, 
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: true
  )
  validates(
    :password,  
    presence: true, 
    length: { minimum: 6 }
  )
  validates(
    :username,  
    presence: true, 
    length: { maximum: 50 },
    format: { with: /\A[a-z0-9-]+\z/}, # Slug or URL type
    uniqueness: true
  )
end
