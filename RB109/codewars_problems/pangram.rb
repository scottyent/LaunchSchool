=begin
Input: a string
Output: true or false based on whether it's a panagram

Rules
can be upper or lowercase
there will be punctuation
Steps:
- downcase the string
- iterate through a range from "a".."z"
- if does not include that letter, return false
- otherwise return true at the end

=end

def pangram?(str)
  str.downcase!
  ('a'..'z').each { |letter| return false if !str.include?(letter) }
  true
end

# Test Cases
p pangram?("The quick brown fox jumps over the lazy dog.") == true
p pangram?("This is not a pangram.") == false