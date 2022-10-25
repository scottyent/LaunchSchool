=begin
Input: two strings
Output: true or false depending on if the letters in str1 can be rearranged to create str2

Rules
only lowercase
no punctuation
you can clearly throw out letters
so it doesn't need to be a perfect match (not an anagram)

Steps:
use all to check the condition if every letter is included in str1
if they're all in str1, then it can be rearranged into str2
=end

def scramble(str1, str2)
  str2.chars.all? do |letter|
    if str1.include?(letter)
      str1.sub!(letter, '')
      true
    else
      false
    end
  end
end

# Test Cases
p scramble('rkqodlw','world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true