# Tell Ruby to make use of AR's built-in ORM methods
# Make User a subclass of ActiveRecord::Base
class User < ActiveRecord::Base
  # ActiveRecord macro works in conjunction with ruby gem bcrypt
  # to encrypt password, gives us ability to access attr `password`
  has_secure_password
  has_many :problems
  # Validates that specified attributes are not blank
  validates_presence_of :username, :password
end