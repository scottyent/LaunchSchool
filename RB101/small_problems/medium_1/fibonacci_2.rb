# Input: nth place of a fibonacci number
# Output: the number at that place in the sequence


# Rules
# We're rewriting this in the procedural way, skpping
# recursion to see if we can save on the time/memory intensity of recursion

# Algo
# Create a starting array with 1, 1 in it to get it started
# I'm not sure if this will work, but if you push the previous two values summed
# while using an each loop to iterate
# and assign a break point when the index value is reached...
# then I think it would prevent an infinite loop but should iterate until the place is found

require 'pry'
require 'pry-byebug'


def fibonacci(n)
  fib_array = [1, 1]

  fib_array.each_with_index do |number, index|
    break if index == (n - 1)
    if index > 0
      fib_num = number + fib_array[index - 1]
      fib_array.push(fib_num)
    end
  end

  fib_array.last
end

# Test Cases
p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
fibonacci(100_001) # => 4202692702.....8285979669707537501