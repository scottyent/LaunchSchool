# Input: 2 separate integer arguments, first is the count (Size of the output array), second is the starting number
# Output: an array starting at the starting number, range of multiples until the array is the size of the count

# Rules
# If the count given is 0, it has to return an empty array
# starting number can be any integer (pos, neg), but count is only >= 0

# Algo
# Select since it will return an empty array if zero
# Iterate through a range of starting number to starting number * count
# Choose only those that are divisible by the starting number
# That doesn't work though beause of the 3rd example, it'd range form 0 to 0,
# With times, it can guarantee the array output is the right size
# And would just multiply the number each time by num + 1

# def sequence(count, start)
#   result = []
#   count.times do |index|
#     result  << (index + 1) * start
#   end
#   result
# end

# Attempt to refactor
def sequence(count, start)
  (0..(count -1)).map { |num| (num + 1) * start }
end

# Their more logical refactored solution - I'm not sure why I subtracted then re-added to ever index :D
def sequence(count, first)
  (1..count).map { |value| value * first }
end


# Test Cases
p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []