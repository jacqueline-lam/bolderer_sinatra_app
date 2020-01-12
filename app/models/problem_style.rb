class ProblemStyle < ActiveRecord::Base
  belongs_to :problem
  belongs_to :style
end