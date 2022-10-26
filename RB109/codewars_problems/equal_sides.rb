=begin
Input: an array of integers
Output: an integer representing an index where left and right sides are equal (sum)

Rules
It's not inclusive of the number at the index
e.g. [1,2,3,4,3,2,1] -> 3
because [1,2,3].sum == [3,2,1]
should pick the first index found if they all work (accomplished by returning out of the block)


Steps:
iterate over the array, with index number
left side equals array[0...index] (so beginning up to but not including the index)
right side is same slice, but from index + 1..-1, so to the end

check equality
return index if equal

lastly, return -1 because none was found
=end

def find_even_index(int_array)
  int_array.each_with_index do |num, index|
    left = int_array[0...index].sum
    right = int_array[index + 1..-1].sum
    return index if left == right
  end

  -1
end

# Test Cases
p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index(Array(1..100)) == -1
p find_even_index([0,0,0,0,0]) == 0 # "Should pick the first index if more cases are valid")
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
p find_even_index(Array(-100..-1)) == -1