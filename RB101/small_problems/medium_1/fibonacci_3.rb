# Input: nth place of a fib sequence
# Output: the last digit of the value at that nth place

# Rules
# It's kind of vauge, I assume you return an integer and not a string
# Doesn't say not to use your past method so I will

# Algo
# Use method to find the fib number
# store it in a variable
# convert to string
# then return the last place after calling to_i on it

def fibonacci(n)
  fib_array = [1, 1]

  fib_array.each_with_index do |number, index|
    break if index == (n - 1)
    if index > 0
      fib_num = number + fib_array[index - 1]
      fib_array.push(fib_num)
    end
  end
  p fib_array
  fib_array.last
end

def fibonacci_last(nth)
  fib_number = fibonacci(nth)
  fib_number.to_s[-1].to_i
end

# Test Cases
p fibonacci_last(15) == 0        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20) == 5        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100) == 5       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001) == 1   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) == 3 # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) == 4 # -> 4

# More efficient and flexible solution they gave:
def fibonacci_last(nth)
  last_2 = [1, 1]
  3.upto(nth) do
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end

  last_2.last
end

# This works by using the % 10 to basically keep track of the ones place only
# Why this works, I honestly have no idea. I can see that % 10 cuts things off
# to the ones place, but at some point you're only doing math with the ones place
# I mean... I guess that makes sense, the ones places added up and then % 10 would
# equal the ones place of the number that they summed to, and then just keep
# working that out like a fibonacci number



