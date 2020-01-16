class User < ActiveRecord::Base
  has_secure_password
  has_many :sessions
  # Validates that specified attributes are not blank
  validates_presence_of :username, :password
end