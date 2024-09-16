# tree.rb
# frozen_string_literal: true

require_relative 'node'

class Tree
  def initialize(data_arr)
    @data_arr = data_arr.sort!.uniq!
    @root = build_tree(@data_arr)
  end

  def insert(data, current = @root, new_node = Node.new(data), parent = nil)
    return @root = Node.new(data) if @root.nil?

    while current
      parent = current

      case current.data <=> new_node.data
      when 1 then current = current.left
      when -1 then current = current.right
      else return
      end
    end

    parent.data > data ? parent.left = new_node : parent.right = new_node
  end

  def find_successor(node)
    successor = node.right

    successor = successor.left while successor.left
    successor
  end

  def delete(data, current = @root)
    return nil if current.nil?

    if current.data > data
      current.left = delete(data, current.left)
    elsif current.data < data
      current.right = delete(data, current.right)
    else
      return current.left if current.right.nil?

      return current.right if current.left.nil?

      successor = find_successor(current)
      current.data = successor.data
      current.right = delete(successor.data, current.right)
    end

    current
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

  def find(data, current = @root)
    return nil if current.nil?

    return puts current.data if current.data == data

    find(data, current.left)
    find(data, current.right)

    nil
  end

  def level_order(queue = [@root], order = [])
    return nil if @root.nil?

    until queue.empty?
      current = queue.shift
      order << current.data
      queue << current.left unless current.left.nil?
      queue << current.right unless current.right.nil?
    end

    p order
  end

  def inorder(data = @root, order = nil)
    order ||= []

    return order if data.nil?

    inorder(data.left, order)
    order << data.data
    inorder(data.right, order)

    order
  end
end
