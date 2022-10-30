=begin
Input: a string
Output: a string with even characters upcased, and odd index downcased


Rules
it will only be alpha chars and spaces.
spaces count in the indexing

Steps:
initialize results string to empty string
iterate over the string split into an array
use each with index
if even index, upcase and shovel it into the string
  otehrwise downcase and shove it
  to simplify this I'll downcase to start

  start over for each word
  so we'll do
  split first
=end

def weirdcase(str)
  str.downcase!
  word_array = str.split

  if word_array.size == 1
    results = ''

    str.chars.each_with_index do |char, index|
      index.even? ? results << char.upcase : results << char
    end
  else
    fixed_array = word_array.each_with_object([]) do |word, arr|
      word.chars.each_with_index do |char, index|
        index.even? ? arr << char.upcase : arr << char
      end
      fixedi
    end
    results = fixed_array.join(" ")
  end

    results
end

# Test Cases

p weirdcase('This') == 'ThIs'
p weirdcase('is') == 'Is'
p weirdcase('This is a test') #== 'ThIs Is A TeSt'