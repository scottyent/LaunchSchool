=begin
Input: an integer
Output: an integer representing the sum of all multiples of 5/3

Rules
If a number is divisible by 5 AND 3, only count it once


Steps:
A few approaches.
1.
Iterate from 1 to the number
put in any number if it's divisible by 5 or 3
sum that array

2.
Just iterate by steps, adding all numbers to an array
do one for 5 and one for 3
That's kind of wasteful though

=end

# For the record, this one liner was fun to make but I don't think it
# is particular good for readability

def test(max)
  (1...max).select { |num| num % 3 == 0 || num % 5 == 0 }.sum
end

# Test Cases
p test(10) ==  23
p test(20) ==  78
p test(200) ==  9168