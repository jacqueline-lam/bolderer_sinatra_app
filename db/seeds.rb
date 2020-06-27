# Add seed data here. Seed your database with `rake db:seed`

puts "Running DB seed..."

# Don't let seed duplicate data more than once
puts "Dropping DB..."
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
  "compression",
  "powerful",
  "overhang",
  "flexible",
  "balance",
  "dihedral",
  "slab",
  "mantle"]

puts "Creating base Styles..."
styles.each do |style|
  Style.create(name: style)
end

# seed DB with dummy data
# users and their respective problems
puts "Creating sample Users..."
user_1 = User.new({username: "jackie", password: "12345"})
user_2 = User.new({username: "sam", password: "54321"})
user_3 = User.new({username: "natalie", password: "67890"})
user_1.save!
user_2.save!
user_3.save!

base_date = Date.today - 15.day

problem_data = [
  #User 1
  [base_date, "red", "V5", '<blockquote class="imgur-embed-pub" lang="en" data-id="f6jea5L"><a href="//imgur.com/f6jea5L">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', ["compression", "slab"], user_1.id],
  [base_date, "black", "V3", '<blockquote class="imgur-embed-pub" lang="en" data-id="yE9bcDH"><a href="//imgur.com/yE9bcDH">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', ["crimps", "slab"], user_1.id],
  [base_date + 1.day, "white", "V4", '<blockquote class="imgur-embed-pub" lang="en" data-id="qhovyFu"><a href="//imgur.com/qhovyFu">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', ["jugs", "powerful", "flexible"], user_1.id],
  [base_date + 5.day, "yellow", "V4", '<blockquote class="imgur-embed-pub" lang="en" data-id="whnG7Sd"><a href="//imgur.com/whnG7Sd">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', ["crimps", "flexible", "balance", "slab"], user_1.id],
  [base_date + 10.day, "black", "V4", '<blockquote class="imgur-embed-pub" lang="en" data-id="WlIv118"><a href="//imgur.com/WlIv118">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', ["body tension", "flexible", "mantle"], user_1.id],
  # User 2
  [base_date, "blue", "V6", '<blockquote class="imgur-embed-pub" lang="en" data-id="WfBSvVr"><a href="//imgur.com/WfBSvVr">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', ["crimps", "body tension", "flexible"], user_2.id],
  [base_date, "black", "V6", '<blockquote class="imgur-embed-pub" lang="en" data-id="Tz1Ea67"><a href="//imgur.com/Tz1Ea67">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', ["pinches", "body tension", "powerful", "overhang"], user_2.id],
  [base_date + 1.day, "black", "V5", '<blockquote class="imgur-embed-pub" lang="en" data-id="jod5gFX"><a href="//imgur.com/jod5gFX">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', ["body tension", "compression", "powerful"], user_2.id],
  [base_date + 5.day, "yellow", "V7", '<blockquote class="imgur-embed-pub" lang="en" data-id="5D6KV7C"><a href="//imgur.com/5D6KV7C">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', ["crimps", "pinches", "powerful", "overhang"], user_2.id],
  [base_date + 12.day, "pink", "V7", '<blockquote class="imgur-embed-pub" lang="en" data-id="pKogmXZ"><a href="//imgur.com/pKogmXZ">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', ["crimps", "body tension", "powerful"], user_2.id],
  # User 3
  [base_date + 3.day, "blue", "V8", '<blockquote class="imgur-embed-pub" lang="en" data-id="mbyzIOA"><a href="//imgur.com/mbyzIOA">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', ["crimps", "body tension", "powerful"], user_3.id],
  [base_date + 5.day, "pink", "V8", '<blockquote class="imgur-embed-pub" lang="en" data-id="Rc01Obn"><a href="//imgur.com/Rc01Obn">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', ["crimps", "slopers", "pinches", "body tension"], user_3.id],
  [base_date + 12.day, "blue", "V9", '<blockquote class="imgur-embed-pub" lang="en" data-id="mBoDq6d"><a href="//imgur.com/mBoDq6d">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>', ["crimps", "body tension", "powerful"], user_3.id]
]

# Create dummy Problems
puts "Creating dummy Problems..."
problem_data.each do |data|
  p = Problem.create(
    date: data[0],
    color: data[1],
    grade: data[2],
    image: data[3],
    user_id: data[5],
  )

  style_names = data[4]
  puts "Adding #{style_names} styles to problem #{p.id}"

  # retutn array of style instances for each problem
  styles_with_these_names = style_names.map { |name| Style.find_by(name: name) }
  # Create ProblemStyle to make the many-to-many relation
  styles_with_these_names.each do |style|
    ps = ProblemStyle.new
    ps.problem_id = p.id
    ps.style_id = style.id
    ps.save!
  end
end