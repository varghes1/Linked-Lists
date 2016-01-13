require "minitest/autorun"

class LinkedListNode
  attr_accessor :value, :next_node

	def initialize(value, next_node=nil)
  	@value = value
  	@next_node = next_node
	end
end

class Stack
  attr_accessor :data
  
  def initialize
    @data = nil
  end

  def push(value)
    node = LinkedListNode.new(value, @data)
    @data = node
  end

  def pop
    if @data == nil
      return nil
    end
    popped_value = @data.value
    @data = @data.next_node
    return popped_value
  end

  def reverse!
    rev_list = nil
    while @data != nil
      value = self.pop
      rev_list = LinkedListNode.new(value, rev_list)
    end
    @data = rev_list
  end

  def reverse
    rev_list = Stack.new
    value = self.pop
    while value != nil
      rev_list.push(value)
      value = self.pop
    end
    return rev_list
  end

  def reverse_mutate
    new_head = @data #node3
    @data = @data.next_node
    new_head.next_node = nil
    while @data != nil
      item = @data #node2
      @data = @data.next_node #node
      item.next_node = new_head #makes node2's next node 'node'
      new_head = item
    end
    @data = new_head
    # prev_node = nil
    # old_head.next_node = prev_node
    # while @data.next_node != nil
    #   prev_node = @data.next_node
    #   @data.next_node = old_head
    #   @data = prev_node
    # end
    print_values(@data)
  end

end

def reverse_list(list)
  @list = list
  newlist = Stack.new
  while @list.value != nil
    newlist.push(pop(@data))
    @list = @list.next_node
  end
  return newlist
end

def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else      
    print "nil\n"
    return
  end
end



class TestStack < MiniTest::Unit::TestCase

  def test_pushpop
    stack = Stack.new
    stack.push(12)
    stack.push(30)
    stack.push(59)
    first_value = stack.pop
    assert_equal(59, first_value)
    assert_equal(30, stack.pop)
    assert_equal(12, stack.pop)
  end

  def test_reverse
    stack = Stack.new
    stack.push(12)
    stack.push(30)
    stack.push(59)
    stack.reverse!
    assert_equal(12, stack.pop)
    assert_equal(30, stack.pop)
    assert_equal(59, stack.pop)
  end

  def test_nil
    stack = Stack.new
    stack.push(12)
    stack.pop
    assert_equal(nil, stack.pop)
  end

  def test_reversemutate
    stack = Stack.new
    stack.push(12)
    stack.push(30)
    stack.push(59)
    stack.reverse_mutate
    assert_equal(12, stack.pop)
    assert_equal(30, stack.pop)
    assert_equal(59, stack.pop)
  end

end




node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)

puts "............."
puts "NEEDS TO BE"
puts "12 --> 99 --> 37 --> nil"
puts "BUT YOU GET"

new_stack = Stack.new
new_stack.push(12)
new_stack.push(99)
new_stack.push(37)

new_stack.reverse_mutate




# puts new_stack.pop()
# puts new_stack.pop()
# puts new_stack.pop()


