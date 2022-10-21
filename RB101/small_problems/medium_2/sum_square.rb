=begin
Input: integer
Output: integer representing the difference between all numebrs summed
then squared and all numbers squared then summed

Rules
It's integers
positive numbers only

Steps:
initialize a squared_summed variable to 0
initialize a summed variable

iterate from 1 to the number given
add it to the summed variable
square it and add it to the squared sum variable

in the end, square the summed variable and subtract the squared summed variable

=end

def sum_square_difference(num)
  squared_summed = 0
  summed = 0

  1.upto(num) do |int|
    summed += int
    squared_summed += int ** 2
  end

  (summed ** 2) - squared_summed
end

# Test Cases
p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150