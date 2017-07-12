require './MTGFlavorCraver.rb'


file = File.read('/Users/sbackus/Code/MTGFlavorCraver/AllSets.json')
all_sets = JSON.parse(file)
puts random_flavor(all_sets)
