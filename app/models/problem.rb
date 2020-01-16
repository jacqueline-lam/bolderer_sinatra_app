class Problem < ActiveRecord::Base
  belongs_to :session
  has_many :problem_styles
  has_many :styles, :through => :problem_styles
  validates_presence_of :color, :grade

  def styles_pretty
    return styles.map(&:name).join(', ')
  end
end