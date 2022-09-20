# Input: An array of numbers
# Output: Sum of each number and the subsequenct sequences of those numbers

# Rules
# Each array will contain at least one number

# Algo
# Initialize results array
# Initialize length counter
# save array size in a variable
# use times loop to loop a specific amount of times (Size of the array)
# each time through, slice to the counter and inject with :+ and put the result into the new array
# And increment the counter

def sum_of_sums(array)
  sums = []

  1.upto(array.size) do |counter|
    sums << array[0, counter].inject(:+)
  end

  sums.sum
end



# Test Cases
p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35