# Define relationships in our 3 models Problem, Style, ProblemStyle
# AR methods gives us access to problems that have a particular style,
# AND all styles by a specific problem
class ProblemStyle < ActiveRecord::Base
  belongs_to :problem
  belongs_to :style

  # validates that problem_id can only be assigned a style_id once
  validates :problem_id, uniqueness: { scope: :style_id, message: "Problems can only be given a style once" }
end