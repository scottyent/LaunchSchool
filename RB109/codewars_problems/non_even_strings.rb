=begin
Input: a string of integers
Output: the number of odd numbered substrings that can be formed

Rules
it's integers and will only be integers


Steps:
again, create an all substrings method and feed the string to it
then iterate through the substrings using select, and the thing to check is
num.to_i.odd?
then count the size of that return array
=end

def find_substrings(string)
  substrings = []
  length = string.length

  length.times do |index|
    1.upto(length - index).each do |sub_length|
      substrings << string[index, sub_length]
    end
  end
  substrings
end

def solve(num_string)
  all_substrings = find_substrings(num_string)
  all_substrings.select { |sub| sub.to_i.odd? }.size
end

# Test Cases
p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28