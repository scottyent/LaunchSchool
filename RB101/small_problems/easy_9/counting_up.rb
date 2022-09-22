# Input: A positive integer
# Output: an array in sequence counting from 1 to the number

# Algo
# Very easy - make a range, convert to array

# def sequence(range_end)
#   (1..range_end).to_a
# end

# Further exploration - handle negative numbers
def sequence(range_end)
  range_end.negative? ? (range_end..1).to_a : (1..range_end).to_a
end

p sequence(-5) == [-5, -4, -3, -2, -1, 0, 1]
p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(-2) == [-2, -1, 0, 1]