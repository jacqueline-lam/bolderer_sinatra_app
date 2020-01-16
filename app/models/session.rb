class Session < ActiveRecord::Base
  belongs_to :user
  has_many :problems
  # Validates that specified attributes are not blank
  validates_presence_of :date
end