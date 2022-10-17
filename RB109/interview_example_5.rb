# Problem 1

=begin
Find length of the longest substring in the given string that is the same in reverse.
As an example, if the input ws "I like racecars that go fast", the substring ('racecar') length would be 7.
If the length of the input string is 0, return value must be 0.
p longest_palindrome('a') == 1
p longest_palindrome('aa') == 2
p longest_palindrome('baa') == 2
p longest_palindrome('aab') == 2
p longest_palindrome('baabcd') == 4
p longest_palindrome('baablkj12345432133d') == 9
=end

=begin
Input: string
Output: integer representing the longest palindrome that is a substring

Rules
# If the string is empty, must return 0. 1 letter equals 1
QUESTION: what would 'ba' output? 1? If so, we have to include substrings
of length 1.
QUESTION: can it be the whole word? Like if the string is "racecar" (test case 2 answers this)
# Assuming the above is true, substrings are of length 1 >
# Capitalization isn't a factor (all lower caps)

Steps:
# Find all the substrings.
  # Initialize a substrings array variable
  # Iterate from first letter to the last letter (string.size, then times, use as index)
    # Iterate from the letter to the end of the word, slicing from 1 to as high as you can go
    # iterating from 1 to size - index as the length of the cuts
    # put all those results into the substrings results variable
# Iterate through and only take the ones that equal themselves reversed
  # using select, check for substring == substring.reverse
# Sort that by size
# return the biggest size result
=end

def all_substrings(string)
  substrings = []
  string_length = string.size

  string_length.times do |index|
    (1..string_length - index).each { |cut_length| substrings << string[index, cut_length] }
  end

  substrings
end

def longest_palindrome(str)
  if str.size == 0 || str.size == 1
    return str.size
  end

  subs = all_substrings(str)
  palindromes = subs.select { |substring| substring == substring.reverse }
  palindromes.max_by { |word| word.size }.size
end

# Test Cases
p longest_palindrome('a') == 1
p longest_palindrome('aa') == 2
p longest_palindrome('baa') == 2
p longest_palindrome('aab') == 2
p longest_palindrome('baabcd') == 4
p longest_palindrome('baablkj12345432133d') == 9
p longest_palindrome('racecar') == 7
