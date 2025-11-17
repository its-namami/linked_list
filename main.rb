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
puts "Find 5 index: #{list.find(5)}"
puts "Find Laurence index: #{list.find('Laurence') || 'so it\'s empty after all...'}"
puts "Size: #{list.size}"
list.insert_at(6, example: 'hash')
puts "We just inserted a hash on index 6:\n#{list}"
list.insert_at(1, 'cat')
puts "We just inserted a cat on index 1:\n#{list}"
list.insert_at(0, 'doggo')
puts "We just inserted a doggo on index 0:\n#{list}"
puts "First: #{list.head}"
puts "Last: #{list.tail}"
