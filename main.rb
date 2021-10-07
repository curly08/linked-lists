class LinkedList
  def initialize
    @list = Array.new
  end

  # adds a new node containing value to the end of the list
  def append(value)
    @list.push(Node.new(value))
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