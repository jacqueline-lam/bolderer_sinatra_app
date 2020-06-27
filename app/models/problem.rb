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

  # Leaderboard data
  # 1. Users who climbed the most problems
  # Group problems by month and year (result of block)
  # Returns a hash - keys = [Month, Year], values = arrays of problems that correspond to key
  def self.problems_by_month_year
    Problem.all.group_by { |p|
      [p.date.month, p.date.year]
    }
  end

  # Only take problems from this month
  def self.problems_this_month
    self.problems_by_month_year[[Date.today.month, Date.today.year]]
  end

  # Group problems by users
  def self.problems_grouped_by_user
    self.problems_this_month.group_by { |problem| problem.user }
  end

  # Returns array of [[user_instance, problem_count], ...] sorted by count
  def self.users_and_problem_count
    self.problems_grouped_by_user.map { |user, problems| [user, problems.count] }.sort_by { |arr| arr.last }.reverse
  end

  # 2. Best climber - climbed hrake ardest grade
  def self.problems_sorted_by_grade
    self.problems_this_month.sort_by { |problem| problem.grade }.reverse
  end

  # Query Problem table for all problem instances
  def self.problems_by_date
    Problem.all.order('date desc')
  end

end