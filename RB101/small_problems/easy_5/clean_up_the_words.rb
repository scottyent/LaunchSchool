# Input: a string of lower case letters and non-alphabetic characters
# Output: all non alphabetic characters replaced by a space

# Rules:
# If multiple non-alpha characters exist in a row, they should only be replaced with 1 space

# Algo
# Search through the string and sub a space for any non-alpha characters
# but once you have multiple spaces in the thing... hmm that's touguh.
# Iterate through, storing the current char, and if the next char is a space, delete it?

require 'pry'
require 'pry-byebug'

# def cleanup(messy_string)
#   only_alphabetic_string = messy_string.gsub(/[^a-z]/, " ")
#   cleaned_string = ''

#   only_alphabetic_string.each_char do |char|
#     if cleaned_string[-1] == " " && char == " "
#       next
#     end

#     cleaned_string << char
#   end

#   cleaned_string
# end

# More succinct answer given by them
def cleanup(messy_string)
  messy_string.gsub(/[^a-z]/, ' ').squeeze(' ')
end

# Test Case
p cleanup("---what's my +*& line?") == ' what s my line '
p cleanup("that's nice    32$$ just #22 trying to trip this!!! up?") == "that s nice just trying to trip this up "

