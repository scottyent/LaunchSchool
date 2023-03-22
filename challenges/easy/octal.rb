=begin
Implement octal to decimal conversion. Given an octal input string,
your program should produce a decimal output. Treat invalid input as octal 0.

I need to take a number in string format, and convert it into the integer value
representing its decimal value. Any invalid input should be treated as a 0
which is also a zero in decimal.

Algo:
create class Octal that takes a number in the constructor
  - validate the number, if not valid return zero - :DONE
create a method that is to_decimal that returns the integer representing the
decimal

convert to integer then call digits to get a single places starting array
iterate over that array with index, and call the number * 10^index, and sum
it all up into a variable.
  - this was incorrect since I'm not simply calculating a decimal, I'm reversing
  the calculation on an Octal so I need to do the number / 8^index

return that number
=end

require 'pry'
require 'pry-byebug'

class Octal
  def initialize(octal)
    @octal = validate_number(octal)
  end

  def validate_number(num)
    return num.to_i if num.to_i.to_s == num
    0
  end

  def to_decimal
    decimal = 0

    @octal.digits.each_with_index do |digit, idx|
      decimal += digit * 8**idx
    end

    decimal
  end
end