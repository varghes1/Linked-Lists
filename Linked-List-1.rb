class LinkedListNode
  attr_accessor :value, :next_node

	def initialize(value, next_node=nil)
  	@value = value
  	@next_node = next_node
	end
end



class Stack
  attr_reader :data, :list
  
  def initialize
    @data = nil
  end

  def push(value)
    node = LinkedListNode.new(value, @data)
    @data = node
  end

  def pop
    popped_value = @data.value
    @data = @data.next_node
    print popped_value
    print " -->"
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


node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)

puts "............."

new_stack = Stack.new
new_stack.push(12)
new_stack.push(99)
new_stack.push(37)
puts new_stack.pop()
puts new_stack.pop()
puts new_stack.pop()
puts new_stack.pop()

#revlist = reverse_list(node3)

#print_values(revlist)