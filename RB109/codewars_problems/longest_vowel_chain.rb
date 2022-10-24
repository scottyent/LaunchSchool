# The vowel substrings in the word codewarriors are o,e,a,io.
# The longest of these has a length of 2. Given a lowercase
# string that has alphabetic characters only (both vowels and
# consonants) and no spaces, return the length of the longest
# vowel substring. Vowels are any of aeiou.

=begin
Input: a string of all lower case alphabetic characters
Output: the length of the longest consecutive vowels substring

Rules
all lower case
no spaces or punctuation
vowels a, e, i, o, u

Steps:
* set constant to the vowels array :DONE
* initiate vowels substring array :DONE
* iniatate temp_vowels to empty string :DONE
* iterate over the string (using chars)
  if it's a vowel, add it to the temp_vowels string
    if it's not a vowel and tmemp_vowels is not empty,
      then add the temp array to the substrings and reset temp to empty string

=end
VOWELS = %w(a e i o u)

def solve(str)
  vowel_subs = []
  temp_vowels = ''

  str.chars.each_with_index do |letter, index|
    if VOWELS.include?(letter)
      temp_vowels << letter
      vowel_subs << temp_vowels if index == (str.size - 1)
    else
      if !temp_vowels.empty?
        vowel_subs << temp_vowels
        temp_vowels = ''
      end
    end
  end

  vowel_subs.max_by { |sub| sub.size }.size
end

# Test Cases
p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8