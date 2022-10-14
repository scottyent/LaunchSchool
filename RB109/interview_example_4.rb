# Input: Two strings
# Output: boolean value depending on if they share a substring in common

# Given 2 strings, find out if there is a substring that appears in both strings. Return true if you find a substring that appears in both strings, or false if not. Only consider substrings that are longer than one letter long.


# Rules
# Comparing against an empty string (or both empty) will return false
# Longer than ONE LETTER LONG. Duh. One letter would match way more often.
# Case match doesn't matter.


# Algo
# Catch empty strings and return false :DONE
# downcase both strings :DONE
# Create an all_substrings method, and feed it the first string
  # Iterate from zero index up to but not including the size of the string
    # iterate for the length from size of the array to size of the array minus index.
# (I gave up on picking the shorter word due to the complication of introducing a new variable name and needing to compare later)
# Assign this to the variable substrings
# Iterate through the returned substrings array, and use the .include? method to compare it to the second string
# If there is ever a true value for .include? return true, else return false

require 'pry'
require 'pry-byebug'

def substrings(string)
  result = []
  string_length = string.size
  (0...string_length - 1).each do |index|
    (2..string_length - index).each { |sub_length| result << string[index, sub_length] }
  end

  result
end

def substr_test(string1, string2)
  return false if string1.empty? || string2.empty?
  string1.downcase!
  string2.downcase!

  all_substrings = substrings(string1)
  all_substrings.each { |substring| return true if string2.include?(substring) }

  false
end

# Test Cases

p substr_test('Something', 'Fun') == false
p substr_test('Something', 'Home') == true
p substr_test('Something', '') == false
p substr_test('', 'Something') == false
p substr_test('BANANA', 'banana') == true
p substr_test('test', 'lllt') == false
p substr_test('', '') == false
p substr_test('1234567', '541256') == true
p substr_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true
