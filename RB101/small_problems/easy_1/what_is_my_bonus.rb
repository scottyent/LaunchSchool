# Input: Two arguments, one positive integer and a boolean value
# Output: If the value is true, return a bonus that is 50% of the integer. If it's false, return 0
# Rules:
# Returned value should be an integer
# Doesn't specific about integer or float division

# Algo
# return right return 0 if false is the second parameter
# Calculate half of the integer, and return it

# Implementation 1
# def calculate_bonus(income, bonus_eligible)
#   return 0 if bonus_eligible == false
#   income / 2
# end

# Official solution - much more elegant with the ternary operator
def calculate_bonus(salary, bonus)
  bonus ? (salary / 2) : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000