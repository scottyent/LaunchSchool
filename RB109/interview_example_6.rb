=begin


You are going to be given an array of integers. Your job is to take that array and find an index N where the sum of the integers to the
left of N is equal to the sum of the integers to the right of N. If there is no index that would make this happen, return -1.
For example:

Let's say you are given the array [1,2,3,4,3,2,1]: Your function will return the index 3, because at the 3rd position of the array, the sum of left side of the index ({1,2,3}) and the sum of the right side of the index ([3,2,1]) both equal 6.
Another one:

You are given the array [20,10,-80,10,10,15,35]
At index 0 the left side is []
The right side is [10,-80,10,10,15,35]
They both are equal to 0 when added. (Empty arrays are equal to 0 in this problem)
Index 0 is the place where the left side and right side are equal.

p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index(Array(1..100)) == -1
p find_even_index([0,0,0,0,0]) == 0
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
p find_even_index(Array(-100..-1)) == -1
=end

=begin
Input: an array of integers
Output: an integer representing an index where the left and right sides sum to the same thing

Rules
empty arrays = 0
for example, left side of index 0 is an empty array, so equal to zero
If no bal

Steps:
Iterate through the array, and use slice to determine left side
and right side
compare the sums
using the length iterate with times
use the index as the middle point to slice to on the left and start from on the right

[1, 2, 3, 4, 5]

at index 0
[] == 1 2 3 4 5
[0, 0] =
at index 1
1 == 2 3 4 5
[0, == 1,
=end

# 0,0 -> 0, length
# 0, 1 -> 1, length - 1
# 0, 2 -> 2, length - 2

def find_even_index(arr)
  middle_index = -1
  length = arr.size

  length.times do |index|

    left = arr[0..index]
    right = arr[index..-1]

    if left.sum == right.sum
      middle_index = index
      break
    end
  end

  middle_index
end

# Test Cases
p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index(Array(1..100)) == -1
p find_even_index([0,0,0,0,0]) == 0
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
p find_even_index(Array(-100..-1)) == -1