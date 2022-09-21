# Input: string
# Output: Array with all the substrings possible, but all starting from the letter those slices started

# Rules
# You should use the previous leading substrings method you wrote

# Algo
# use the leading substrings method
# Create a broader loop that controls the index number so that it will move up until the end


def leading_substrings(string)
  result = []
  1.upto(string.size) { |counter| result << string[0, counter] }
  result
end

def substrings(string)
  result = []

  string.size.times do |starting_point|
    substring = string[starting_point, (string.size - starting_point)]
    result += leading_substrings(substring)
  end

  result
end



# Test Cases
p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]