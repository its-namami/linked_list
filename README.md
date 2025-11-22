# Linked List

A linked list implementation in Ruby.

## Description

This is a linked list data structure.

## Files

- `main.rb` - Main file
- `lib/linked_list.rb` - LinkedList class
- `lib/node.rb` - Node class

## Usage

Run the main file:

```ruby
ruby main.rb
```

Or use the LinkedList class:

```ruby
require_relative 'lib/linked_list'

list = LinkedList.new
list.append('value')
list.prepend('first')
```

## Methods

- `append(item)` - Adds item to end
- `prepend(item)` - Adds item to start
- `size` - Returns size
- `head` - Returns first value
- `tail` - Returns last value
- `at(index)` - Returns value at index
- `pop` - Removes last item
- `contains?(value)` - Checks if value exists
- `find(value)` - Returns index of value
- `insert_at(index, value)` - Inserts value at index
- `remove_at(index)` - Removes value at index
