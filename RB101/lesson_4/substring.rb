def substrings(string)
  index = 0
  all_substrings = []

  while index < (string.length - 2)
    num_chars = 2
    while num_chars <= (string.length - index)
      all_substrings << string[index, num_chars]
      num_chars += 1
    end
    index += 1
  end
  all_substrings
end

def is_palindrome?(word)
  word.reverse == word
end

def palindrome_substrings(str)
  result = []
  substrings_arr = substrings(str)
  substrings_arr
  substrings_arr.each do |substring|
    result << substring if is_palindrome?(substring)
  end
  result
end

p palindrome_substrings("supercalifragilisticexpialidocious"); # ["ili"]
p palindrome_substrings("abcddcbA");   # ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome"); # []
p palindrome_substrings("");