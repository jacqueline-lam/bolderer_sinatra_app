class Problem < ActiveRecord::Base
  belongs_to :user
  has_many :problem_styles
  has_many :styles, :through => :problem_styles
  validates_presence_of :date, :color, :grade

  COLORS = [
    "white",
    "red",
    "orange",
    "yellow",
    "green",
    "lime",
    "blue",
    "pink",
    "purple",
    "black"
  ]

  def styles_pretty
    styles.map(&:name).join(', ')
  end
end