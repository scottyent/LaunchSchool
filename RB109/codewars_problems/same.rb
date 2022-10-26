=begin
Input: two arrays
Output: boolean true or false depending on if second array contains all the squares of the first array

Rules
order doesn't matter

Steps:
map the first array to a squared array, sorted
sort the second array

compare if the squared and second array are equal
=end

def comp(arr1, arr2)
  return false if arr1 == nil || arr2 == nil
  squared = arr1.map { |num| num * num }.sort
  squared == arr2.sort
end

# Test Cases
p comp( [121, 144, 19, 161, 19, 144, 19, 11],
  [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]) == true