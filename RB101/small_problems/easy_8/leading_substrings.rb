# Input: String
# Output: An array with all the substrings of the string sorted in size order

# Algo
# The same as the sum of subsections, but with strings
# Use the upto to get to the string size, then slice from 0 to the number in length
# Put those sections into a result array

def leading_substrings(string)
  result = []
  1.upto(string.size) { |counter| result << string[0, counter] }
  result
end

# Test cases
p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']