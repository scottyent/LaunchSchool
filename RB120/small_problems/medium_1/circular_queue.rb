=begin
Input: no input, just writing a CircularQueue class to implement a
circular queue behavior
Output: adding and removing objects should reflect appropriately in the test
cases below

Rules
Explicit:
- Removing an item always removes the oldest item
- adding an item adds to the back
- if it's full, you remove the oldest, and replace it with the newest
Implicit:
- if the queue is empty, return nil BUT if the queue has ANY other object,
  ONLY return the object and don't consider nil

  Algorithm
  initialize an empty array filled with the buffer size amount of nils DONE
when asked to remove, always check if all items nil then return nil DONE
  if not, then iterate through and pop the first item that isn't a nil
    and refill with a nil because popping anything will always make the array
    beneath the buffer size

  for adding, I thought we'd have to be more careful about popping and pushing
    but since removingalways makes sure to refill with a nil, technically
    the array is always filled to the right size, so any time you add, you
    HAVE to pop and then push.
[]
#add object to queue as 1
[1]
# Add 2nd obbect
[1, 2]
#remove an object (oldest)
[2]
# Add 3rd object
[2, 3]
# Add 4 to the queue, to fill it up
[2,3,4]
# remove one item (oldest)
[3,4]
# Add 5th item, to make it full
[3,4,5]
# Add 6th item to the queue, replacing oldest item
[6, 4, 5]
- ah. this is where I get tripped up, because replacing the oldest item with
the newest item kind of messes up the order of a natural array, so you don't
really know the age of items anymore, it kind of mixes it.

# add 7th item, replace oldest:
[6, 7, 5] - that wouldn't happen naturally with pop

  but maybe I'm taking this too literal - if you're still using an array
  but not LITERALLY replacing in place, you should still be able to use an array
  you just pop and push at the same time, and the rest of the logic will be
  maintained

  let me try it in the teest cases

  [nil,nil,nil]
  dequeue -> nil - CHECK
  [nil,nil]
  enque 1
  [nil, nil, 1]
  enque 2
  [nil, 1, 2]
  deque -> 1? no, it's a nil. (return oldest that isn't nil fixes this) but
  that would break the first deqeue.
  [nil, nil, 2]

  add 3 add 4
  2, 3,4
  remove -> 2 CHECK

  Add 5,6 ,7,

  5,6,7
  removve ->5 CHECk
  remove check
  remove check
  remove....nil -> oh.


  Ok my problem has to do with nil. So you do have to initialize all as nil
    and you have to make sure the array stays at the appropriate size using
    nil as a filler


  in other words - if you remove from the oldest, but don't add and the array
    isn't the size of the buffer, add a nil.

  so let me try that again:
    [nil1,nil2,nil3]
  dequeue -> nil - CHECK
  add back a nil to make it full again
  [nil2,nil3, nil4]
  enque 1
  [nil3, nil4, 1]
  enque 2
  [nil4, 1, 2]
  remove -> would be a nil but unless we can consider.

=end

require 'pry'
require 'pry-byebug'

class CircularQueue
  def initialize(buffer_size)
    @buffer = Array.new(buffer_size)
  end

  def enqueue(added_item)
    if buffer[-1] == nil
      buffer[-1] = added_item
    else
      buffer.shift
      buffer.push(added_item)
    end
  end

  def dequeue
   return nil if buffer.all?(nil)
   buffer.push(nil)
   buffer.each do |item|
    if item != nil
      return buffer.delete_at(buffer.index(item))
    end
  end
  end

  private

  attr_accessor :buffer
end

# Test Cases - should print true 15 times
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

