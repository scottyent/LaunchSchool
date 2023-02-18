# Write a method that returns a list of all of the divisors of the positive
# integer passed in as an argument. The return value can be in any sequence
# you wish.

require 'pry'
require 'pry-byebug'

# def divisors(num)
#   1.upto(num).select { |int| num % int == 0 }
# end

# Optimized Version

def divisors_faster(int)
  return [int] if int < 2
  result = []
  upper_factor = int
  (1..int).each do |x|
    return result.sort if x == upper_factor
    q, r = int.divmod(x)
    if r == 0
      result << x
      result << q
      upper_factor = q
    end
  end
end

# Test Cases
# p divisors(1) == [1]
# p divisors(7) == [1, 7]
p divisors_faster(12) == [1, 2, 3, 4, 6, 12]
p divisors_faster(98)# == [1, 2, 7, 14, 49, 98]
p divisors_faster(99400891) #== [1, 9967, 9973, 99400891] # may take a minute
p divisors_faster(999962000357) == [1, 999979, 999983, 999962000357]