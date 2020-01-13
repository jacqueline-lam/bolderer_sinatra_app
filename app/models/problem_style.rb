class ProblemStyle < ActiveRecord::Base
  belongs_to :problem
  belongs_to :style

  validates :problem_id, uniqueness: { scope: :style_id, message: "Problems can only be given a style once" }
end