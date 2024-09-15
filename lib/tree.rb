# tree.rb
# frozen_string_literal: true

require_relative 'node'

class Tree
  def initialize(data_arr)
    @data_arr = data_arr.sort!.uniq!
    @root = build_tree(@data_arr)
  end

  def insert(data, current = @root, new_node = Node.new(data), parent = nil)
    return new_node if @root.nil?

    until current.nil?
      parent = current

      case current.data <=> new_node.data
      when 1 then current = current.left
      when -1 then current = current.right
      else current
      end
    end

    parent.data > new_node.data ? parent.left = new_node : parent.right = new_node
  end

  def build_tree(data_arr)
    return if data_arr.empty?

    mid = data_arr.length / 2
    Node.new(data_arr[mid], build_tree(data_arr[...mid]), build_tree(data_arr[mid + 1..]))
  end

  def pretty_print(node = @root, prefix = '', is_left = true) # rubocop: disable Style/OptionalBooleanParameter
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
