# Input: an array of numbers
# Output: the maxium sum that you can make with numbers that are touching each other

# Rules
# Empty array is a valid array, and just returns zero
# an array of all negative numbers also won't have a highest sum, so return 0
# If all positive, it's just the sum of the whole array

# QUESTION? Does it have to be a sum of two numbers or more? I'll assume yes

# Algo
# Start with returning 0 if array is empty
# use all? to check if all positive (return sum)
# if all negative, return 0
# I can catch the empty array in the second elsif because it will return true
# so after checking for pos, check for neg (and as a result, 0 will get caught)

# create a function that returns all possible sub arrays
    # 0, 2 all the way to 0, length of array
    # then 1, 3 all the way to length of the array minus starting index

    # iterate with a number from 0 all the way up to length - 2 (that's the index control)
    # Within each iteration, slice using that number, and create another loop with the length
    # running from 2 (min length) to the length minus the index
    # each slice, scoop that into a results variable


# iterate over those results, tracking with a max variable
# return the max at the end

def all_possible_subarrays(array)
  results = []

   0.upto(array.length - 2) do |index|
    2.upto(array.length - index) { |sub_size| results << array.slice(index, sub_size) }
   end

  results
end


def max_sequance(arr)
  if arr.all? { |num| num.positive? }
    arr.sum
  elsif  arr.all? { |num| num < 0 }
    0
  else
    all_subs = all_possible_subarrays(arr)
    max = all_subs[0].sum
    all_subs.each do |sub_array|
      sum = sub_array.sum
      max = sum if sum > max
    end

    max
  end
end

# Test Cases
p max_sequance([]) == 0
p max_sequance([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequance([11]) == 11
p max_sequance([-32]) == 0
p max_sequance([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12