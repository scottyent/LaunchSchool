# Input: two digits that represent a range
# Output: print all the numbers in the range, replacing them with fizzbuzz as appropriate

# Rules
# number divisible by 3 and 5 = "FizzBuzz"
# Number divisible by 5 = "Buzz"
# Number divisible by 3 = "Fizz"

# Algo
# Iterate through a range, from first number .upto(secondnumber)
# If a number is divisible by both 5 and 3, then puts fizzbuzz
# Elssif divisible by 5 print buzz
# elsif divisble by 3 print fizz
# else print number

require 'pry'
require 'pry-byebug'

def fizzbuzz(start, finish)
  result = []

  start.upto(finish) do |number|
    #binding.pry
    value = case
            when number % 5 == 0 && number % 3 == 0
              "FizzBuzz"
            when number % 5 == 0
              "Buzz"
            when number % 3 == 0
              "Fizz"
            else
              number
            end

    result << value
  end

  p result.join(", ")
end
# Test case
fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz