# seed all Styles
require_relative "../app/models/style.rb"

# Don't let seed duplicate data more than once
if Style.count > 0
  abort
end

styles = ["dyno", "crimps", "jugs", "slopers", "pinches", "pockets", "body tension", "compressions", "powerful", "flexible", "overhang", "dihedral", "slab"]
styles.each do |style|
  Style.create(name: style)
end

# seed DB with dummy data
# users and their respective problems
user_1 = User.create(username: "jackie", password_digest: "$2a$12$1HgDwUJG2QrnDmn9pPmw..WhAsKWrXxpNInGeA12.fwnEUaHhHNj2")
user_2 = User.create(username: "sam", password_digest: "$2a$12$SI5FA2XIMjSIkO1dV/iVu.VNfmVUCWw/FKJsWDrDdqfGuSLLeLRsS")

base_date = '1/1/2020'.to_date

problem_data = [
  [base_date, "red", "V2", user_1.id],
  [base_date + 1.day, "white", "V3", user_1.id],
  [base_date + 2.day, "yellow", "V4", user_1.id],
  [base_date + 3.day, "lime", "V5", user_1.id],
  [base_date + 4.day, "white", "V5", user_1.id],
  [base_date, "pink", "V5", user_2.id],
  [base_date, "yellow", "V5", user_2.id],
  [base_date + 1.day, "black", "V3", user_2.id],
  [base_date + 2.day, "blue", "V8", user_2.id],
  [base_date + 3.day, "pink", "V7", user_2.id],
  [base_date + 4.day, "black", "V5", user_2.id],
]

# Create dummy Problems
problem_data.each do |data|
  Problem.create(
    date: data[0],
    color: data[1],
    grade: data[2],
    user_id: data[3],
  )
end

# Create some ProblemStyles
Problem.all.each do |problem|
  # Give it some random styles
  num_styles = rand(1..3)

  num_styles.times do
    rand_style_id = rand(1..Style.last.id)
    ProblemStyle.create(
      problem_id: problem.id,
      style_id: rand_style_id,
    )
  end
end
