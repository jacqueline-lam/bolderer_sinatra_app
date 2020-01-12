class Style < ActiveRecord::Base
  has_many :problems, through: :problem_styles
end