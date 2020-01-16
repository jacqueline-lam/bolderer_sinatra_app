class Style < ActiveRecord::Base
  has_many :problem_styles
  has_many :problems, :through => :problem_styles
  validates_presence_of :name
end