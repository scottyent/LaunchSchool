=begin
Input: an integer
Output: an integer representing the next featured number

Rules
A featured number is:
- odd
- multiple of 7
- no integer is repeated

return an error if there is no possible number

Steps:
I'm just going to use a simple loop and increment the number
by 7 each time

check each number for odd?
create a method to check for multiple digits
  check if numbers.digits.size == numbers.digits.uniq.size
return number if both these are true

=end

def featured(num)

  loop do
    num += 1
    break if num % 7 == 0
  end

  loop do
    return num if num.odd? && unique_digits?(num)
    break if num >= 9876543201
    num += 7
  end
  "There is no possible featured number above this value"
end

def unique_digits?(number)
  number.digits.size == number.digits.uniq.size
end

# Test Cases
p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987


p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements