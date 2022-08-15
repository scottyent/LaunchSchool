# Input: A group of strings separated by spaces
# Ouptut: A hash that tracks the frequency of occurances based on string length
# this time excluding the non alphabet characters

def word_sizes(sentence)
  sentence.delete!("\^a-zA-Z ")

  word_array = sentence.split

  word_array.each_with_object(Hash.new(0)) do |word, hash|
    count = word.length
    hash[count] += 1
  end
end

# Test Cases
p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}