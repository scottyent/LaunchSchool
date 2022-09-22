# Input: String
# Output: New string where only consonants are double

# Algo
# Use last exercise code
# set an if, so if consonants double, else, just shovel in the character
# What's the best way to filter that though?
# match a regex where the ranges are A-Za-z^aeiou
# That will take care of exlcuding vowels, and digitls/punctuation etc weren't in the A-Za-z range to begin with

require 'pry'
require 'pry-byebug'

def double_consonants(string)
  string.chars.each_with_object(String.new) do |char, string|
    if char.match?(/[A-Za-z]/) && char.match?(/[^aeiou]/)
      string << char * 2
    else
      string << char
    end
  end
end


# Test Cases
p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""