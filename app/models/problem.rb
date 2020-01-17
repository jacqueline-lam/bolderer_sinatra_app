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

  GRADES = [
    "V0",
    "V1",
    "V2",
    "V3",
    "V4",
    "V5",
    "V6",
    "V7",
    "V8",
    "V9",
    "V10",
    "V11",
    "V12",
    "V13"
  ]

  def styles_pretty
    styles.map(&:name).join(', ')
  end
end