# Input: an integer reprsenting the number of digits to search for
# Output: an integer representing the index of the first place that occurs
# in the Fibonacci series

# Algo
# a loop that generates fibonacci numbers
# Save the number to an array
# Each number generated, compare to the length needed
# If it's the right amount of numbers, find index on that number
# Return the index and break out of the loop

require 'pry'
require 'pry-byebug'

def find_fibonacci_index_by_length(length)
  series = [1, 1]

  loop do
    new_number = series[-2] + series[-1]
    series << new_number
    return series.index(new_number) + 1 if new_number.to_s.length >= length
  end
end


# Test Cases
p find_fibonacci_index_by_length(2) #== 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847