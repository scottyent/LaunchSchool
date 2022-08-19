# Input: String
# Output: A new String with the consecutive duplicate characters reduced to one

# Rules
# This isn't just for 2 back to back, it's for as many back to back as exists
# e.g. 'ggggggg' -> g as much as 'gg' goes to g
# Not allowed to use squeeze or squeeze! methods

# Algo

# I think it's pretty straight forward
# Iterate through current letter is the one in the iteration
# last letter will be assigned at the end of the iteration
# compare current letter to last letter and if they're the same, next over the loop
# If not, add to the new string

require 'pry'
require 'pry-byebug'

# def crunch(double_string)
#   new_string = ''
#   last_letter = ''

#   double_string.each_char do |letter|
#     # binding.pry
#     if letter == last_letter
#       next
#     else
#       new_string << letter
#     end

#     last_letter = letter
#   end

#   new_string
# end

# Attempt with regular expressions

def crunch(double_string)
  double_string.each_char do |letter|
    double_string.gsub!(/#{letter}{2,}/, letter)
  end

  double_string
end

# Test Cases
p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''