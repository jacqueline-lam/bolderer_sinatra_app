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
  "overhang",
  "flexible",
  "balance",
  "dihedral",
  "slab",
  "mantles"]

styles.each do |style|
  Style.create(name: style)
end

# seed DB with dummy data
# users and their respective problems
user_1 = User.new({username: "jackie", password: "12345"})
user_2 = User.new({username: "sam", password: "54321"})
user_3 = User.new({username: "natalie", password: "67890"})
user_1.save!
user_2.save!
user_3.save!

base_date = '1/1/2020'.to_date

problem_data = [
  #User 1
  [base_date, "red", "V5", '<blockquote class="imgur-embed-pub" lang="en" data-id="f6jea5L"><a href="//imgur.com/f6jea5L">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', [8, 14], user_1.id],
  [base_date, "black", "V3", '<blockquote class="imgur-embed-pub" lang="en" data-id="yE9bcDH"><a href="//imgur.com/yE9bcDH">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', [2, 14], user_1.id],
  [base_date + 1.day, "white", "V4", '<blockquote class="imgur-embed-pub" lang="en" data-id="qhovyFu"><a href="//imgur.com/qhovyFu">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', [3, 9, 11], user_1.id],
  [base_date + 3.day, "yellow", "V4", '<blockquote class="imgur-embed-pub" lang="en" data-id="whnG7Sd"><a href="//imgur.com/whnG7Sd">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', [2, 11, 12, 14], user_1.id],
  [base_date + 5.day, "black", "V4", '<blockquote class="imgur-embed-pub" lang="en" data-id="WlIv118"><a href="//imgur.com/WlIv118">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', [7, 11, 15], user_1.id],
  # User 2
  [base_date, "blue", "V6", '<blockquote class="imgur-embed-pub" lang="en" data-id="WfBSvVr"><a href="//imgur.com/WfBSvVr">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', [2, 7, 11], user_2.id],
  [base_date, "black", "V6", '<blockquote class="imgur-embed-pub" lang="en" data-id="Tz1Ea67"><a href="//imgur.com/Tz1Ea67">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', [5, 7, 9, 10], user_2.id],
  [base_date + 1.day, "black", "V5", '<blockquote class="imgur-embed-pub" lang="en" data-id="jod5gFX"><a href="//imgur.com/jod5gFX">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', [7, 8, 9], user_2.id],
  [base_date + 3.day, "yellow", "V7", '<blockquote class="imgur-embed-pub" lang="en" data-id="5D6KV7C"><a href="//imgur.com/5D6KV7C">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', [2, 5, 9, 10], user_2.id],
  [base_date + 5.day, "pink", "V7", '<blockquote class="imgur-embed-pub" lang="en" data-id="pKogmXZ"><a href="//imgur.com/pKogmXZ">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', [2, 7, 9], user_2.id],
  # User 3
  [base_date + 3.day, "blue", "V8", '<blockquote class="imgur-embed-pub" lang="en" data-id="mbyzIOA"><a href="//imgur.com/mbyzIOA">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', [2, 7, 9], user_3.id],
  [base_date + 3.day, "pink", "V8", '<blockquote class="imgur-embed-pub" lang="en" data-id="Rc01Obn"><a href="//imgur.com/Rc01Obn">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', [2, 4, 5, 7], user_3.id],
  [base_date + 5.day, "blue", "V9", '<blockquote class="imgur-embed-pub" lang="en" data-id="mBoDq6d"><a href="//imgur.com/mBoDq6d">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', [2, 7, 9], user_3.id]
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
