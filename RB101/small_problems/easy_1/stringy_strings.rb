# Input: An integer
# Output: a string of alternativing 1's and 0's equal to the length of the integer

# Algo
# - create an empty string to store the result
# - create a counter
# - add 1, then 0, then 1, then 0
# - Do this in a loop that's limited to the size of the string being equal to the initial integer

# Implementation 1
def stringy(number, starter=1)
  result = ''
  counter = 0
  choices = ['1', '0']

  if starter == 0
    choices.reverse!
  end

  while counter < number
    if counter % 2 == 0
      result << choices[0]
    else
      result << choices[1]
    end
    counter += 1
  end
  result
end

# Official Answer
# def stringy(size)
#   numbers = []

#   size.times do |index|
#     number = index.even? ? 1 : 0
#     numbers << number
#   end

#   numbers.join
# end

# Tests
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

puts stringy(6, 0) == '010101'
puts stringy(9, 0) == '010101010'
puts stringy(4, 0) =='0101'
puts stringy(7, 0) == '0101010'