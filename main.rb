# frozen_string_literal: true

require_relative 'lib/linked_list'

list = LinkedList.new
puts "Size: #{list.size}"
list.prepend('start')
list.append(5)
list.append('dog')
list.append('dog')
list.prepend(%w[example array])
list.prepend('first_item')
list.append('last_item')
# list.insert_at(1, example: 'hash')

puts "Size: #{list.size}"
puts list
puts "Head value: #{list.head}"
puts "Tail value: #{list.tail}"
