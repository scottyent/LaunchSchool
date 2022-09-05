# Input: A array of stringsstring
# Output: An array with all the same letters but without the vowels

# Algo
# Initialize cleaned array
# Iterate over each string in the array
# delete the vowels, and add it back to the new cleaned array
# return the array

require 'pry'
require 'pry-byebug'

def remove_vowels(string_array)
  string_array.map { |string| string.delete("aeiouAEIOU") }
end

# Test Cases
p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']