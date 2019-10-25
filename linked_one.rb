class LinkedListNode
    attr_accessor :value,:next_node
    def initialize(value,nxt=nil)
        @value = value
        @next_node = nxt
    end
end
class Stack
    attr_accessor :data

    def initialize
        @data = nil
    end

    def push(value)
        @data = LinkedListNode.new(value,@data)
    end

    def pop
       v = @data.value
       @data = @data.next_node
       return v
    end
    
    def reverse_with_stack(head)
        s = Stack.new
        while head
            s.push head.value
            head = head.next_node
        end
        return s.data
    end
    def reverse_iterative(head)
        current = head
        prev = nil
        while current do
            nxt = current.next_node
            current.next_node = prev
            prev = current
            current = nxt
        end
        head = prev
        return head
    end

end
s = Stack.new
[1,2,3].each do |i|
    s.push i
end
s.data = s.reverse_with_stack(s.data)
#comment out line above to see non-reversed stack
#can replace method with below to see iterative vs stack: 
#s.data = s.reverse_iterative(s.data)

3.times do |i|
    puts s.pop
end

