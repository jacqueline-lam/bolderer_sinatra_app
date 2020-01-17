class User < ActiveRecord::Base
  # works with gem bcrypt to save password in salted hash version
  has_secure_password
  has_many :problems
  # Validates that specified attributes are not blank
  validates_presence_of :username, :password
end