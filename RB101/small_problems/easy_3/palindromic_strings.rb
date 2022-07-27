# Write a method that returns true if the string passed as an argument is a palindrome, false otherwise.
# A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation and spaces.

# Input: String
# Output: true or false, depending on whether it's a palindrome

# Rules
# Capitalization matters
# Punctuation matters
# You are given a string so you don't have to validate.

def palindrome?(item)
  forward_count = 0
  backwards_count = item.size - 1

  while backwards_count >= 0
    return false if item[forward_count] != item[backwards_count]
    backwards_count -= 1
    forward_count += 1
  end
  true
end


# Tests
p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

# Tests Arrays

p palindrome?([1, 2, 3, 4, 5]) == false
p palindrome?([1, 2, 3, 2, 1]) == true
p palindrome?(['m', 'a', 'd', 'a', 'm']) == true