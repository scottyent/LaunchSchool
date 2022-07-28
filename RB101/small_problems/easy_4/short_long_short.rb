# Write a method that takes two strings as arguments, determines the longest of the two strings,
# and then returns the result of concatenating the shorter string, the longer string,
# and the shorter string once again. You may assume that the strings are of different lengths.

# Input: Two different strings
# Output: A new string that is the result of concatenating the shorter string in the front, the long string in the middle, and the short string again at the end

# Rules
# Assume we're getting two strings, don't validate
# The long word has to be sandwiched in the middle.
# You can assume one will be equal (they're never equal)

# Algo
# Use a simple if statement to check one length against the other
# Return concatenated string that direction
# Else, return it the other direction

def short_long_short(string1, string2)
  if string1.length > string2.length
    long = string1
    short = string2
  else
    long = string2
    short = string1
  end
  "#{short}#{long}#{short}"
end

# Test cases
p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"