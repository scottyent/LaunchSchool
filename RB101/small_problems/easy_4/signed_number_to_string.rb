def integer_to_string(number)
  number.digits.reverse.join
end

def signed_integer_to_string(integer)
  sign = integer < 0 ? '-' : '+'
  sign = '' if integer == 0
  "#{sign}#{integer_to_string(integer.abs)}"
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'