# Add seed data here. Seed your database with `rake db:seed`
# seed all Styles
require_relative "../app/models/style.rb"
require 'pry'

# Don't let seed duplicate data more than once
Style.destroy_all
ProblemStyle.destroy_all
Problem.destroy_all
User.destroy_all

styles = [
  "dyno",
  "crimps",
  "jugs",
  "slopers",
  "pinches",
  "pockets",
  "body tension",
  "compressions",
  "powerful",
  "flexible",
  "overhang",
  "dihedral",
  "slab"]
styles.each do |style|
  Style.create(name: style)
end

# seed DB with dummy data
# users and their respective problems
user_1 = User.new({username: "jackie", password: "12345"})
user_2 = User.new({username: "sam", password: "54321"})
user_1.save!
user_2.save!

problems = [
  {
    date: '1/1/2020'
    color: "Red"
    grade: "V5"
    image: "<blockquote class="imgur-embed-pub" lang="en" data-id="f6jea5L"><a href="//imgur.com/f6jea5L">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>"
    style_ids: [8, 13],
    user_id: 1
  }
]

base_date = '1/1/2020'.to_date

problem_data = [
  [base_date, "red", "V5", user_1.id,
  [base_date + 1.day, "white", "V3", user_1.id],
  [base_date + 2.day, "yellow", "V4", user_1.id, "<blockquote class="imgur-embed-pub" lang="en" data-id="whnG7Sd"><a href="//imgur.com/whnG7Sd">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>"],
  [base_date + 3.day, "lime", "V5", user_1.id],
  [base_date + 4.day, "white", "V5", user_1.id],
  [base_date, "pink", "V5", user_2.id],
  [base_date, "yellow", "V5", user_2.id],
  [base_date + 1.day, "black", "V3", user_2.id],
  [base_date + 2.day, "blue", "V8", user_2.id, "<blockquote class="imgur-embed-pub" lang="en" data-id="mbyzIOA"><a href="//imgur.com/mbyzIOA">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>"],
  [base_date + 3.day, "pink", "V7", user_2.id],
  [base_date + 4.day, "black", "V5", user_2.id],
]

# Create dummy Problems
problem_data.each do |data|
  Problem.create(
    date: data[0],
    color: data[1],
    grade: data[2],
    image: data[3],
    style_ids: data[4],
    user_id: data[5],
  )
end

# Create some ProblemStyles
# Problem.all.each do |problem|
#   # Give it some random styles
#   num_styles = rand(1..3)

#   num_styles.times do
#     rand_style_id = rand(1..Style.last.id)
#     ProblemStyle.create(
#       problem_id: problem.id,
#       style_id: rand_style_id,
#     )
#   end
# end
