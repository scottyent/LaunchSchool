# Problem 1

# You have to create a method that takes a positive integer number and returns the next bgiger number formed by the same digits:

# 12 ==> 21
# 513 ==> 531
# 2017 ==> 2071
# If no biggger number can be composed, return -1

# 9 ==> -1
# 111 ==> -1
# 531 ==> -1

# I'm sure there's a more efficient solution than what I'm about to do, but oh well

# First set number_array equal to the integer converted to a string, and split by chars
# create an empty array of number permutations
# use permutation to assign every possible perm into this array
# sort it
# iterate through the array, and if larger number is found, return -1
# If a larger number IS found, return on the first one since it's sorted

# My initial solution
# def next_bigger_num(num)
#   number_array = num.to_s.chars
#   num_perms = []
#   number_array.permutation { |perm| num_perms << perm.join.to_i }

#   num_perms.sort.each { |sort_num| return sort_num if sort_num > num }

#   -1
# end

# Written algorithm following the logic in the example he gave
# Iterate from 0 to the max number it can be (so num.to_s.chars.sort {|a, b| b <=> a }).join.to_i
# check if the item has the same sigits AND is larger than the current number
# if you hit, return it, otherwise return -1

# Ok attempting to writ it out using the logic they've implied in the video so far
# It worked! But at first I did 0 up to biggest num instead of just num to biggest num

def same_digits?(num1, num2)
  num1.digits.sort == num2.digits.sort
end

def next_bigger_num(num)
  biggest_num = num.digits.sort { |a, b| b <=> a }.join.to_i

  num.upto(biggest_num) do |check_num|
    return check_num if same_digits?(num, check_num) && check_num > num
  end

  -1
end

p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(2071) == 2107
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123456789) == 123456798
