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
    to 900 in roman numerals, then 8 in the tens, convert that to 80, then convert
    single digits.

  so you add to the roman variable each iteration (and skip 0)

  ok so the algoritm would be

  if the number 1-3, then multiply the place by the roman numeral representation.
  if the number is 4, original number subtracted from mid number
  if it's 5 just convert to mid number
  if it is 6-8 do mid number number modulo 5 times the original roman repre
  if 9 use the next up place and subtract from there.

  I believe I could use a dictionary describing the placees (ones, tens etc)
  and then access the base + the mid point as needed. How do I know when base
  to use...

  how about an array that shows the bases (which are keys) equal to the size
  of the number? ok - then I could access that with size - 1. So starting
  index for a 4 place number, is 3 (thousands), then once you iterate past that
  subtract a number to get 2 (hundreds), and so on.
  ["ones", "tens", "hundreds", "thousands"]

=end

class RomanNumeral
  PLACES = ["ones", "tens", "hundreds", "thousands"]
  CONVERTER = {
    "ones" => {base: 'I', middle: 'V'},
    "tens" =>   {base: 'X', middle: 'L'},
    "hundreds" => {base: 'C', middle: 'D'},
    "thousands" => {base: 'M'}
  }

  def initialize(decimal)
    @decimal_array = decimal.to_s.chars.map(&:to_i)
  end

  def to_roman
    roman = ''
    place_index = @decimal_array.size - 1

    @decimal_array.each do |digit|
      conversion = convert(digit, place_index)
      roman << conversion if conversion
      place_index -= 1
    end

    roman
  end

  private

  def convert(value, index)
    place = PLACES[index]

    case value
    when 1..3 then CONVERTER[place][:base] * value
    when 4 then CONVERTER[place][:base] + CONVERTER[place][:middle]
    when 5 then CONVERTER[place][:middle]
    when 6..8 then CONVERTER[place][:middle] + (CONVERTER[place][:base] * (value % 5))
    when 9 then CONVERTER[place][:base] + CONVERTER[PLACES[index + 1]][:base]
    end
  end
end