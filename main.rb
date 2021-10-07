class LinkedList
  attr_accessor :head, :tail, :next_node, :size
  def initialize
    @head = @next_node
    @tail = nil
    @next_node = @tail
    @size = 0
  end

  # adds a new node containing value to the end of the list
  def append(value)
    @next_node = Node.new(value, @tail)
    @head = @next_node
    @size += 1
  end

  # adds a new node containing value to the start of the list
  def prepend(value)
    @next_node = Node.new(value, @next_node)
    @head = @next_node
    @size += 1
  end

  def size
    p @size
  end
end

class Node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

list = LinkedList.new
p list
list.append(5)
p list
list.prepend(10)
p list

list.size
