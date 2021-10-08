# LinkedList class
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
    @tail = self.tail
  end

  # adds a new node containing value to the start of the list
  def prepend(value)
    @head = Node.new(value, @head)
    @size += 1
    @tail = self.tail
  end

  # returns the total number of nodes in the list
  def size
    @size
  end

  # returns the first node in the list
  def head
    @head
  end

  # returns the last node in the list
  def tail
    node = @head
      until node.next_node == nil
        node = node.next_node
      end
    @tail = node
  end

  # returns the node at the given index
  def at(index)
    node = @head
    index.times do
      node = node.next_node
    end
    return node unless node == nil

    'no node exists at this index'
  end

  # removes the last element from the list
  def pop
    node = @head
    until node.next_node == self.tail
      node = node.next_node
    end
    node.next_node = nil
    @size -= 1
  end

  # returns true if the passed in value is in the list and otherwise returns false
  def contains?(value)
    node = @head
    self.size.times do
      return true if node.data == value
      node = node.next_node
    end
    false
  end

  # returns the index of the node containing value, or nil if not found
  def find(value)
    node = @head
    for i in 0..self.size - 1 do
      return i if node.data == value
      node = node.next_node
    end
    nil
  end

  # represents my LinkedList objects as strings
  def to_s
    node = @head
    self.size.times do
      print "( #{node.data} ) -> "
      node = node.next_node
    end
    print "nil\n"
  end

  # inserts a new node with the provided value at the given index
  def insert_at(value, index)
    if index == 0
      self.prepend(value) 
    elsif index >= self.size
      self.append(value)
    else
      self.at(index - 1).next_node = Node.new(value, self.at(index))
      @size += 1
      @tail = self.tail  
    end
  end

  # removes the node at the given index
  def remove_at(index)
    if index >= self.size
      self.pop
    elsif index == 0
      @head = self.at(index + 1)
      @size -= 1
    else
      self.at(index - 1).next_node = self.at(index + 1)
      @size -= 1
    end
  end
end

# Node class
class Node
  attr_reader :data
  attr_accessor :next_node
  def initialize(value = nil, next_node = nil)
    @data = value
    @next_node = next_node
  end
end

# list = LinkedList.new
# list.append(5)
# list.prepend(10)
# list.prepend(15)
# list.append(20)
# list.append(30)
# list.append('dog')
# list.insert_at('cat', 6)
# list.insert_at('bat', 3)

# puts list.size
# puts list.head
# puts list.tail
# puts list.at(2)
# list.pop
# puts list.tail
# p list
# p list.contains?('dog')
# p list.find(21)
# list.to_s
# list.remove_at(3)
# list.to_s
