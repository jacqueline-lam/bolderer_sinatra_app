class Problem < ActiveRecord::Base
  belongs_to :user
  has_many :problem_styles
  has_many :styles, :through => :problem_styles
  validates_presence_of :date, :color, :grade

  def styles_pretty
    return styles.map(&:name).join(', ')
  end
end