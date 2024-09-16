# node.rb
# frozen_string_literal: true

# Class Node takes care of building node needed in tree.
class Node
  include Comparable

  attr_accessor :data, :left, :right

  def initialize(data, left = nil, right = nil)
    @left = left
    @right = right
    @data = data
  end

  def <=>(other)
    data <=> other.data
  end
end
