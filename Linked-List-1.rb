class LinkedListNode
  attr_accessor :value, :next_node
 
  	def initialize(value, next_node=nil)
    	@value = value
    	@next_node = next_node
  	end

  	def print_values
      print "#{value} --> "
      if next_node == nil
        puts "nil"
        return
      else
        next_node.print_values
      end
    end
end



class Stack
    attr_reader :data
    
    def initialize
      @data = nil
    end

    # Push a value onto the stack
    def push(value)
      node = LinkedListNode.new(value, @data)
      @data = node

        # IMPLEMENT ME!
    end

    # Pop an item off the stack.  
    # Remove the last item that was pushed onto the
    # stack and return the value to the user
    def pop
      @data = @data.next_node
        return @data.value
    end


    def reverse_list(list)

      reverselist = Stack.new

      list.each do |value_to_move|
        while value_to_move.next_node != nil
          reverselist.push(list.pop)
        end
      end
    end

    def print_values
      print "#{value} --> "
      if next_node == nil
        puts "nil"
        return
      else
        next_node.print_values
      end
    end

end




node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
puts ((node3.next_node).next_node).value

stack = Stack.new
stack.push(37)
stack.push(99)
stack.push(12)
stack.data.print_values
other_stack = Stack.new
 
node3.print_values

puts "............."

revlist = reverse_list(node3)

revlist.print_values