# Write a method that takes a string as an argument and returns
# the character that occurs least often in the given string.
# If there are multiple characters with the equal lowest number
# of occurrences, then return the one that appears first in the
# string. When counting characters, consider the uppercase and
# lowercase version to be the same.

=begin
Input: string
Output: one character that occures least often

Rules
If is a tie, it should go to the first one found
Uppercase and lower case are the same
spaces and punctuation count as characters

Steps:
* mutate the string by destructively calling downcase!
* Break the string using chars to preserve spaces
* initialize a count variable equal to zero
* initialize rarest_char = ''
* iterate through the array
* use the count function, and if it's lower than the current count (only lower, not equal to)
* change the count to that, and the rarest char to that element

ok let me throw this all out and just do the min_by on the character array by count in the array



=end

# First crack at it
# def least_common_char(str)
#   str.downcase!
#   char_array = str.chars

#   char_array.min_by { |char| char_array.count(char) }
# end

# Solving it a second way (longer) for a challenge
def least_common_char(str)
  str.downcase!
  char_array = str.chars

  count = char_array.count(char_array[0])
  rarest_char = char_array[0]

  char_array.each do |char|
    current_count = char_array.count(char)
    if current_count < count
      count = current_count
      rarest_char = char
    end
  end

  rarest_char
end

# Test Cases
# Examples:

p least_common_char("Hello World") == "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") == "t"
p least_common_char("Mississippi")== "m"
p least_common_char("Happy birthday!") == ' '
p least_common_char("aaaaaAAAA") == 'a'

# The tests above should print "true".