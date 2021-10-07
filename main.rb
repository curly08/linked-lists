class LinkedList
  attr_reader :head, :tail, :next_node
  def initialize
    @head = @next_node
    @tail = nil
    @next_node = @tail
  end

  # adds a new node containing value to the end of the list
  def append(value)
    @next_node = Node.new(value, @tail)
    @head = @next_node
  end

  # adds a new node containing value to the start of the list
  def prepend(value)
    @next_node = Node.new(value, @next_node)
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
p list.append(5)
p list
p list.prepend(10)
p list
