=begin
Input: a string
Output: an array with the smallest substring that repeats, and the amount of time it repeats
to create the whole string size

Rules

Steps:
get all substrings :DONE
iterate through substrings, and pick ones that their count * length == same size as original string
then save the minimum to the right variable, and then divide the str.size/sub.size as the multiple
=end

def find_all_substrings(str)
  substrings = []
  length = str.length

  length.times do |index|
    1.upto(length - index) do |sub_length|
      substrings << str[index, sub_length]
    end
  end

  substrings
end

def f(str)
  all_substrings = find_all_substrings(str)
  sub_multiples = all_substrings.select do |substring|
    str.scan(substring).size * substring.length == str.size
  end

  smallest_sub = sub_multiples.min_by { |sub| sub.length }
  multiple = str.size / smallest_sub.size

  [smallest_sub, multiple]
end

# Test Cases
p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]