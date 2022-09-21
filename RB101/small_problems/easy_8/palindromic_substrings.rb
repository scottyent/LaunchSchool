# Input: string
# Output: a list of palindromes, arranged in the order they were found

# Rules
# palindromes should be returned in the order they're found
# duplicates are allowed
# single characters are not palindromes
# Case matters, so leave that in tact
# you should use your substrings method

# Algo
# Since the substrings method creates a list of substrings in order
# Simply iterate over the result
# Select items where the word is equal to the word reversed

require 'pry'
require 'pry-byebug'


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

# My solution
# def palindromes(string)
#   all_substrings = substrings(string)
#   all_substrings.select { |word| word.size > 1 ? word == word.reverse : false }
# end

# Further Exploration
# Create this to ignore non-alphanumeric characters and case

def palindromes(string)
  cleaned_string = string.downcase.gsub(/[^A-Za-z0-9]/, '')
  all_substrings = substrings(cleaned_string)
  all_substrings.select { |word| word.size > 1 ? word == word.reverse : false }
end

# Test Cases
# p palindromes('abcd') == []
# p palindromes('madam') == ['madam', 'ada']
# p palindromes('hello-madam-did-madam-goodbye') == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
# p palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]

# p palindromes('hello-madam-did-madam-goodbye') == [
#   'll', 'madam', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
# p palindromes('KniTT!?!?!?inG cass??!!ettes') #== [
# #    'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# #  ]

p palindromes('knitting cass???ettes') #== [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]