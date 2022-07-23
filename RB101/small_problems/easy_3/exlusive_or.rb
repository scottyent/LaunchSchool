# Input: two conditions that return boolean values likely
# Output: only return true if 1 argument of the two is true, and false if not
require 'date'

def xor?(first_arg, second_arg)
  [first_arg, second_arg].count(true) == 1 ? true : false
end

# p xor?(5.even?, 4.even?) == true
# p xor?(5.odd?, 4.odd?) == true
# p xor?(5.odd?, 4.even?) == false
# p xor?(5.even?, 4.odd?) == false

today = Time.new

p today.day
puts Date.today