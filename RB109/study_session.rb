# Find the longest substring in alphabetical order.
# Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".
# The input will only consist of lowercase characters and will be at least one letter long.
# If there are multiple solutions, return the one that appears first.

=begin
Input: a string
Output: a subtring that is the longest alphabetical substring
dude doesn't know what a substring is yikes


Rules
case doesn't matter
iterate over the chars
create a comparison, if the letter ord number is greater than than the previous number, continue

init results array
init temp array inside the loop
add char - then next one, is the ord higher than temp_string.last.ord, continue
if not, then shove the temp array into the results, and reassign temp_string to be empty again

lastlyy results sortby size, then return the first string in the array

Steps:
=end

require 'pry'
require 'pry-byebug'

def longest(string)
  results = []
  letter_array = string.chars

  temp_string = ''

  letter_array.each do |letter|
    if temp_string.empty?
      temp_string << letter
    elsif letter.ord > temp_string[-1].ord
      temp_string << letter
    else
      results << temp_string
      temp_string = ''
      temp_string << letter
      binding.pry
    end
  end

  p results
end

# Test Cases
# p longest('asd') == 'as'
p longest('nab') == 'ab'
# p longest('abcdeapbcdef') ==  'abcde'
# p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
# p longest('asdfbyfgiklag') == 'fgikl'
# p longest('z') == 'z'
# p longest('zyba') == 'z'


# problem 2

# For "x", determine how many positive integers less than or equal to "x" are odd but not prime. Assume "x" is an integer between 1 and 10000.

# Example: 5 has three odd numbers (1,3,5) and only the number 1 is not prime, so the answer is 1
# Example: 10 has five odd numbers (1,3,5,7,9) and only 1 and 9 are not prime, so the answer is 2

# A prime number (or a prime) is a natural number greater than 1 that has no positive divisors other than 1 and itself.

def is_prime?(number)
  2.upto(number - 1) do |num|
    return false if number % num == 0
  end

  true
end

def odd_not_prime(num)
  match = 1
  1.upto(num) do |number|
    if number.odd? && !is_prime?(number)
      match += 1
    end
  end

  match
end

p odd_not_prime(15) == 3
p odd_not_prime(48) == 10
p odd_not_prime(82) == 20


