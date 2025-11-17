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
    return append(item) if first_node.nil?

    self.first_node = Node.new(item, first_node)
  end

  def size
    inject(0) { |size, _| size + 1 }
  end

  def head
    first_node.value
  end

  def tail
    last_node.value
  end

  def at(desired_index)
    desired_index = size + desired_index if desired_index.negative?

    each.with_index { |item, index| return item if index == desired_index }

    nil
  end

  def pop
    popped_item = last_node.dup
    self.last_node = node_at(-2)
    last_node.next_node = nil

    popped_item.value
  end

  def contains?(value)
    each { |element| return true if value.eql?(element) }

    false
  end

  def find(value)
    each.with_index { |element, index| return index if element.eql?(value) }

    nil
  end

  def to_s
    map(&:to_s).join(' -> ')
  end

  def insert_at(index, value)
    raise ArgumentError if index > size || index.negative?

    return append(value) if index == size
    return prepend(value) if index.zero?

    new_node = Node.new(value, node_at(index))
    node_at(index - 1).next_node = new_node
  end

  def remove_at(index)
    raise ArgumentError if index >= size || index.negative?

    case index
    when size - 1
      pop
    when 0
      shifted_value = first_node.value.dup
      self.first_node = first_node.next_node
      shifted_value
    else
      removed_value = at(index).dup
      node_at(index - 1).next_node = node_at(index).next_node
      removed_value
    end
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

    inject([]) { |map, element| map << yield(element) }
  end

  def node_at(desired_index)
    desired_index = size + desired_index if desired_index.negative?

    each_node.with_index { |item, index| return item if index == desired_index }

    nil
  end
end
