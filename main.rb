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
puts "List at index 3: #{list.at(3)}"
puts "List at index 0: #{list.at(0)}"
puts "List at index -1: #{list.at(-1)}"
puts "List at index -9: #{list.at(-9) || 'it\'s falsey, so empty, eh'}"
puts "Popped item: #{list.pop}"
puts "Current list: #{list}"
puts "Does the list contain cat? #{list.contains?('cat') ? 'Yes' : 'No'}"
puts "Does the list contain 5? #{list.contains?(5) ? 'Yes' : 'No'}"
