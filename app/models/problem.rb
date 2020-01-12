class Problem < ActiveRecord::Base
  has_many :styles, through :problem_styles
  belongs_to :session
end