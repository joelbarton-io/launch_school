require 'pry'
class CircularQueue
  def initialize(buffer_size)
    @queue = Array.new(buffer_size)
    @last_added = nil
  end

  def enqueue(obj)
    if @last_added.nil?
      @queue[] = obj
      @last_added = obj
    end
  end

  def dequeue

  end

  def full?
    queue.none? {|elem| elem.nil?}
  end

  def to_s
    "#{queue}"
  end
end

my_queue = CircularQueue.new(3)

my_queue.queue[0] = 1
my_queue.queue
puts my_queue

=begin
queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

=end