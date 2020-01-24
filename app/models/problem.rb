class Problem < ActiveRecord::Base
  belongs_to :user
  has_many :problem_styles
  has_many :styles, :through => :problem_styles
  validates_presence_of :date, :color, :grade

  # Constants for colors + grades as a single source of truth
  # If we ever need to change colors, we can do so here
  # other places it's referenced will updated as well
  COLORS = [
    "White",
    "Red",
    "Orange",
    "Yellow",
    "Green",
    "Lime",
    "Blue",
    "Pink",
    "Purple",
    "Black"
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