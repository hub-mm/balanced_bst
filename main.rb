# main.rb
# frozen_string_literal: true

require_relative 'lib/tree'

tree = Tree.new([1, 7, 23, 8, 4, 9, 3, 5, 7, 9, 67, 6345, 324])

puts "\n|-----------------------------|\n\n"
puts "Base tree:\n\n"
tree.pretty_print

puts "\nLevel order traversal:"
p tree.level_order
puts "\nPreorder traversal:"
p tree.preorder
puts "\nPostorder traversal:"
p tree.postoder
puts "\nInorder traversal:"
p tree.inorder

tree.insert(10)
tree.insert(2)
tree.insert(109_292)
tree.insert(0)
tree.insert(45)
tree.insert(50)
tree.insert(6)
tree.insert(12)
tree.insert(17)
tree.insert(15)
tree.insert(20)
tree.insert(77)
puts "\n|-----------------------------|\n\n"
puts "Insert method:\n\n"
tree.pretty_print

puts "\nLevel order traversal:"
p tree.level_order
puts "\nPreorder traversal:"
p tree.preorder
puts "\nPostorder traversal:"
p tree.postoder
puts "\nInorder traversal:"
p tree.inorder

tree.delete(109_292)
tree.delete(67)
tree.delete(4)
tree.delete(9)
puts "\n|-----------------------------|\n\n"
puts "Delete method:\n\n"
tree.pretty_print

puts "\nLevel order traversal:"
p tree.level_order
puts "\nPreorder traversal:"
p tree.preorder
puts "\nPostorder traversal:"
p tree.postoder
puts "\nInorder traversal:"
p tree.inorder

puts "\n|-----------------------------|\n\n"

puts "Find method: #{tree.find(1)}, #{tree.find(6)}, #{tree.find(50)}, #{tree.find(324)}"

puts "\nHeight method: #{tree.height(10)}, #{tree.height(1)}, #{tree.height(23)}, #{tree.height(324)}, #{tree.height(8)}"

puts "\nDepth method: #{tree.depth(50)}, #{tree.depth(1)}, #{tree.depth(6345)}, #{tree.depth(5)}, #{tree.depth(8)}"

puts "\nBalanceed tree: #{tree.balanced?}"

puts "\n|-----------------------------|\n\n"

puts "Unbalanced tree:\n\n"
tree.pretty_print

puts "\nLevel order traversal:"
p tree.level_order
puts "\nPreorder traversal:"
p tree.preorder
puts "\nPostorder traversal:"
p tree.postoder
puts "\nInorder traversal:"
p tree.inorder
puts "\n|-----------------------------|\n\n"

puts "Rebalanced tree:\n\n"
tree.rebalance
tree.pretty_print

puts "\nLevel order traversal:"
p tree.level_order
puts "\nPreorder traversal:"
p tree.preorder
puts "\nPostorder traversal:"
p tree.postoder
puts "\nInorder traversal:"
p tree.inorder

puts "\nBalanceed tree: #{tree.balanced?}"
puts "\n|-----------------------------|\n\n"
