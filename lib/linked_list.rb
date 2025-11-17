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

  def size
    inject(0) do |size, _|
      size + 1
    end
  end

  def head
    first_node.value
  end

  def tail
    last_node.value
  end

  def at(desired_index)
    desired_index = size + desired_index if desired_index.negative?

    each.with_index do |item, item_index|
      return item if item_index == desired_index
    end

    nil
  end

  def pop
    popped_item = last_node.dup
    last_node = node_at(-2)
    last_node.next_node = nil

    popped_item.value
  end

  def contains?(value)
    include?(value)
  end

  def to_s
    return 'warning: empty list' if first_node.nil?

    map(&:to_s).join(' -> ')
  end

  private

  attr_accessor :first_node, :last_node

  # Traversables

  def each_node
    return enum_for(:each_node) unless block_given?

    current = first_node

    until current.nil?
      yield current
      current = current.next_node
    end

    self
  end

  def each
    return enum_for(:each) unless block_given?

    each_node { |node| yield node.value }
  end

  def inject(accumulator)
    return enum_for(:inject) unless block_given?

    each { |element| accumulator = yield accumulator, element }

    accumulator
  end

  def map
    return enum_for(:map) unless block_given?

    map = []

    each { |element| map << yield(element) }

    map
  end

  def include?(value)
    each { |element| return true if value.eql?(element) }

    false
  end

  def node_at(desired_index)
    desired_index = size + desired_index if desired_index.negative?

    each_node.with_index do |item, item_index|
      return item if item_index == desired_index
    end

    nil
  end
end
