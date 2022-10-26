=begin
Input: an array of integers
Output: the number that appears an odd number of times

Rules
there will only ever be one number that appears an odd number of times

Steps:
use select then just index to the only element?
=end

def find_it(num_array)
  odd_num = num_array.select { |num| num_array.count(num).odd? }
  odd_num[0]
end

# Test Cases
p find_it([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5]) == 5
p find_it([1,1,2,-2,5,2,4,4,-1,-2,5]) == -1
p find_it([20,1,1,2,2,3,3,5,5,4,20,4,5]) == 5
p find_it([10]) == 10
p find_it([1,1,1,1,1,1,10,1,1,1,1]) == 10