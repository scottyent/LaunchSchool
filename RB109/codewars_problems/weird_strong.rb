=begin
Input: a string
Output: a string with even characters upcased, and odd index downcased


Rules
explicit
- it will only be alpha chars and spaces.

implicit
 - spaces are not part of the capitalization changes
 - So it starts new for each word basically
 - It's case insensitive in that it only matters that the right index is the right size, so we can downcase from the beginning
  - and then just focus on upcasing what we need to

Steps:
initialize results string to empty string
iterate over the string split into an array
use each with index
if even index, upcase and shovel it into the string
  otehrwise downcase and shove it
  to simplify this I'll downcase to start

if it's more than one word:
  iterate through each word with index
  set that index of the array equal to case_change(word)
  this will modify the word_array
  then join with a space between and return that
end
=end

def case_change(word)
  results = ''

  word.chars.each_with_index do |char, index|
    index.even? ? results << char.upcase : results << char
  end

  results
end


def weirdcase(str)
  str.downcase!
  word_array = str.split

  if word_array.size == 1
    case_change(str)
  else
    word_array.each_with_index do |word, index|
      word_array[index] = case_change(word)
    end

    word_array.join(' ')
  end
end

# Test Cases

p weirdcase('This') == 'ThIs'
p weirdcase('is') == 'Is'
p weirdcase('This is a test') == 'ThIs Is A TeSt'