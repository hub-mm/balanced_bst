# tree.rb
# frozen_string_literal: true

require_relative 'node'

class Tree
  attr_accessor :root

  def initialize(data_arr)
    data_arr = [] if data_arr.nil?
    data_arr = data_arr.sort!.uniq!
    @root = build_tree(data_arr)
  end

  def build_tree(data_arr)
    return nil if data_arr.nil? || data_arr.empty?

    mid = data_arr.length / 2
    Node.new(data_arr[mid], build_tree(data_arr[...mid]), build_tree(data_arr[mid + 1..]))
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

  def find(data, current = @root)
    return nil if current.nil?

    return current.data if current.data == data

    find(data, current.left) || find(data, current.right)
  end

  def level_order(queue = [@root], order = [])
    return nil if @root.nil?

    until queue.empty?
      current = queue.shift
      order << current.data
      queue << current.left unless current.left.nil?
      queue << current.right unless current.right.nil?
    end

    order
  end

  def inorder(data = @root, order = nil)
    order ||= []

    return order if data.nil?

    inorder(data.left, order)
    order << data.data
    inorder(data.right, order)

    order
  end

  def preorder(data = @root, order = nil)
    order ||= []

    return order if data.nil?

    order << data.data
    preorder(data.left, order)
    preorder(data.right, order)

    order
  end

  def postoder(data = @root, order = nil)
    order ||= []

    return order if data.nil?

    postoder(data.left, order)
    postoder(data.right, order)
    order << data.data

    order
  end

  def height(node, current = @root)
    return -1 if current.nil?

    return node_height(current) if current.data == node

    left_result = height(node, current.left)
    return left_result unless left_result == -1

    height(node, current.right)
  end

  def depth(node, current = @root, current_depth = 0)
    return -1 if current.nil?

    return current_depth if current.data == node

    left_depth = depth(node, current.left, current_depth + 1)
    return left_depth unless left_depth == -1

    depth(node, current.right, current_depth + 1)
  end

  def balanced?(node = @root)
    return true if node.nil?

    left_height = height(node.left.data)
    right_height = height(node.right.data)

    (left_height - right_height).abs <= 1
  end

  def rebalance
    @root = build_tree(inorder) unless balanced?
  end

  def pretty_print(node = @root, prefix = '', is_left = true) # rubocop: disable Style/OptionalBooleanParameter
    return if node.nil?

    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  private

  def find_successor(node)
    successor = node.right

    successor = successor.left while successor.left
    successor
  end

  def node_height(node)
    return -1 if node.nil?

    left_height = node_height(node.left)
    right_height = node_height(node.right)

    1 + [left_height, right_height].max
  end
end
