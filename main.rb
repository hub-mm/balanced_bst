# main.rb
# frozen_string_literal: true

require_relative 'lib/tree'

tree = Tree.new([1, 7, 23, 8, 4, 9, 3, 5, 7, 9, 67, 6345, 324])

puts "\n|-----------------------------|\n\n"
tree.pretty_print

tree.insert(10)
tree.insert(2)
tree.insert(109_292)
tree.insert(0)
tree.insert(45)
tree.insert(50)
tree.insert(6)
puts "\n|-----------------------------|\n\n"
tree.pretty_print

tree.delete(109_292)
tree.delete(67)
tree.delete(4)
tree.delete(9)
puts "\n|-----------------------------|\n\n"
tree.pretty_print

puts "\n|-----------------------------|\n\n"
