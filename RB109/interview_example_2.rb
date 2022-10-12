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

def next_bigger_num(num)
  number_array = num.to_s.chars
  num_perms = []
  number_array.permutation { |perm| num_perms << perm.join.to_i }

  num_perms.sort.each { |sort_num| return sort_num if sort_num > num }

  -1
end

p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123456789) == 123456798
