=begin
Input: array of integers
Output: an integer representing the minimum number you can insert to make the sum prime

Rules
List size is at least 2
list is only positive integers
repeat numbers is fine
seems to want you to use a new list?

Steps:
sum up the array :DONE
create helper method prime? :DONE
loop
start from that sum, iterate up until number is prime
save as next prime, and quit the loop
return next prime - sum of array
=end

def prime?(num)
  (2...num).each { |number| return false if num % number == 0 }
  true
end

def minimum_number(num_array)
  total = num_array.sum
  total += 1 until prime?(total)
  total - num_array.sum
end

# Test Cases
p minimum_number([3,1,2]) == 1
p minimum_number([5,2]) == 0
p minimum_number([1,1,1]) == 0
p minimum_number([2,12,8,4,6]) == 5
p minimum_number([50,39,49,6,17,28]) == 2