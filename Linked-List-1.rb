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

  def pop(node_out)
    popped_value = node_out.value
    return popped_value
    @data = @data.next_node
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
end


node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
#puts ((node3.next_node).next_node).value

# stack = Stack.new
# stack.push(37)
# stack.push(99)
# stack.push(12)
# stack.data.print_values
# other_stack = Stack.new

print_values(node3)

puts "............."

revlist = reverse_list(node3)

print_values(revlist)


# def reverse_list(takes in a node which is the head of the linked list)
#   the arugment it took in needs to be made an instance variable
#   create a variable which equals a new Stack so that nil is at the bottom
#   while the argument.value is nil
#     pop the top of the linkedlist and push it to the top of the newly created stack
#     the instance variable that was created will now equal the next node in the argument passed
#   end
#   return the newly created stack
# end
