# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

=begin
Input: a string
Output: a string modified (in place or not?) with every third word having every second character capitalized

Question: Do I have to return new string or modify the existing object
I'll try both

Rules
odd indexes of rthe letter changing
don't have to worry about punctuation


Steps:
* create results array
* Split the string into words to make it easier to iterate through
* Iterate over the words with_index, and if it is a third word (index + 1 % 3)
  * create an array with the characters
  * iterate over the char array with index
  * if it is an odd index, then upcase! that character
  join the characters array as the return value for map

.join the results of map
=end

def to_weird_case(str)
  results = []
  word_array = str.split

  word_array.each_with_index do |word, index|
    if (index + 1) % 3 == 0
      characters = word.chars
      characters.each_with_index { |char, index| char.upcase! if index.odd? }
      results << characters.join
    else
      results << word
    end
  end

    results.join(' ')
end

# Test Cases

# Examples:

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
                'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# The tests above should print "true".