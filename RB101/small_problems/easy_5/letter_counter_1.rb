# Input: A group of strings separated by spaces
# Ouptut: A hash that tracks the frequency of occurances based on string.length

# Rules:
# Words consist of any characters that don't include space
# The hash is not sorted by a specific value, so likely just added as you iterate over

# Algo
# Split the strings into an array
# Iterate over the array
# Use the string size as a key to increment the appropriate hash value

def word_sizes(sentence)
  word_array = sentence.split

  word_array.each_with_object({}) do |word, hash|
    count = word.length
    hash.key?(count) ? hash[count] += 1 : hash[count] = 1
  end
end


# Test Cases
p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}