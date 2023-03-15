# Write some code that converts modern decimal numbers into their Roman number equivalents.

=begin
Input: an integer
Output: the roman number equivalent

Rules
Explicit:
* 0's are just passed over
Implicit:
* the place in the number determines the conversion, so 0th index on a 4 length
number is  thousands
* Any single place number larger than 3 moves on from III to  number before
means substraction - IV = 4. Number after means addition IV = 6 up until again, 8
* You have to dn instantiate a RomanNumeral object and pass in the number
and then call to_roman on it to get the return value of a roman numeral

Algorithm:
* convert number to digits to iterate through
* determine how many places the number has, and start at the left of the number
  * If it's thousands, just multiply the number by the letter M
  * if it's hundreds:
      is it divisible by 500? if so, you can use a D


  ok there is a pattern here for all levels.
  The first three, are the representative for that place:
       I = 1
       X = 10
       C = 100
       M = 1000

  after you get past the first three, you go to the middle point and subtract
  or add up to 8

      IV = 4, V = 5, VI = 6, VII = 7, VIII = 8
      XL = 40, L = 50, LX = 60, LXX = 70, LXXX = 80
      CD = 400, D = 500, DC = 600, DCC = 700, DCCC = 800

  then when you hit 9, it's the top level minus one
    IX = 9, X = 10
    XC = 90, C = 100
    MC = 900, M = 1000


  when iterating, you can just convert as it goes so 9 in the hundreds, convert
    to 900 in roman numerals, then 8 in the tens, convert that, then convert
    single digits.

  so you add to the roman_numeral variable each iteration (and skip 0)
=end

class RomanNumeral
  def initialize(decimal)
    @decimal = decimal
  end

  def to_roman
    roman_numeral = ''

    roman_numeral # or use each with object and let that return the string
  end
end

end

# Test Cases