# Input: String
# Output: an array with each word + space and word length

# Rules

# Algo
# Split on space to a word array
# map that array to then add a space + words size to the word

def word_lengths(string)
  string.split.map { |word| "#{word} #{word.size}"}
end

# Test Cases
p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []