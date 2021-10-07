require 'pry-byebug'
class LinkedList
  attr_accessor :head, :tail, :next_node, :size
  def initialize(head = nil, tail = nil)
    @head = head
    @tail = tail
    @size = 0
  end

  # adds a new node containing value to the end of the list
  def append(value)
    if @head == nil
      @head = Node.new(value)
    else
      node = @head
      until node.next_node == nil
        node = node.next_node
      end
      node.next_node = Node.new(value)
    end
    @size += 1
  end

  # adds a new node containing value to the start of the list
  def prepend(value)
    @head = Node.new(value, @next_node) if @size == 0
    @size += 1
  end

  # returns the total number of nodes in the list
  def size
    @size
  end

  # returns the first node in the list
  def head
    @head
  end
end

class Node
  attr_reader :data
  attr_accessor :next_node
  def initialize(value = nil, next_node = nil)
    @data = value
    @next_node = next_node
  end
end

binding.pry

list = LinkedList.new
p list.append(5)
# list.prepend(10)
# list.prepend(15)
p list

p list.append(20)
p list.append(30)


p list

# # puts list.size
# puts list.head

# first_node = Node.new(1)
# second_node = Node.new(2)
# p first_node
# p second_node
# first_node.next_node = second_node
# p first_node