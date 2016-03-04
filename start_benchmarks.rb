require 'benchmark'

ITERATIONS_FOR_BENCHMARK = 1_000_000

# ruby start_benchmarks.rb

puts ''
puts '###'
puts '# COMPARE DIFFERENT WAYS TO EXTEND OBJECTS IN RUBY'
puts '###'
puts ''
puts '#'
puts '# STATIC WAYS'
puts '#'
puts ''

load 'static_way.rb'

puts ''
puts ''
puts '#'
puts '# DYNAMIC WAYS'
puts '#'
puts ''

load 'dynamically_way.rb'

puts ''
puts '###'
puts '# RESULTS'
puts '###'
puts ''
puts '#'
puts '# Static NO winner => results are nearly equal #'
puts '#'
puts ''
puts ''
puts '#'
puts '# Dynamic winner => inheritance via composition on plain old ruby objects #'
puts '#'
puts ''
puts ''
puts '#'
puts '# Summery'
puts '#'
puts ''
puts "* static is faster then dynamic, but don't have the advantages of dynamic"
puts "* in dynamic section wins: 'inheritance via composition'"
puts ''
puts ''
