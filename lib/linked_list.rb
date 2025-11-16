# frozen_string_literal: true

require_relative 'node'

# This class initializes and manages linked list
class LinkedList
  def initialize
    self.first_node = nil
    self.last_node = nil
  end

  def append(item)
    if first_node.nil?
      self.first_node = Node.new(item)
      self.last_node = first_node
    else
      last_node.next_node = Node.new(item)
      self.last_node = last_node.next_node
    end
  end

  def prepend(item)
    if first_node.nil?
      append(item)
    else
      self.first_node = Node.new(item, first_node)
    end
  end

  def to_s
    return 'warning: empty list' if first_node.nil?

    string = first_node.value.to_s

    current_node = first_node.next_node

    until current_node.nil?
      string += " -> #{current_node.value}"
      current_node = current_node.next_node
    end

    string
  end

  private

  attr_accessor :first_node, :last_node
end
