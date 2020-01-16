# seeding database with dummy data
# create style objects

require_relative "../app/models/style.rb"

styles = ["dyno", "crimps", "jugs", "slopers", "pinches", "pockets", "body tension", "compressions", "powerful", "flexible", "overhang", "dihedral", "slab"]
styles.each do |style|
  Style.create(name: style)
end

