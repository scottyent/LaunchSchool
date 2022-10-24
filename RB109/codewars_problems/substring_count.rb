# Complete the solution so that it returns the number of
# times the search_text is found within the full_text.

=begin
Input: two strings - one full string, and the substring to search for
Output: the count of that substring in the larger string

Rules
What about an empty substring? I guess you can assume
it is larger than 1.
substrings start at size 1 and can be any size


Steps:
if the substring is size 1, just chars the string and use count :DONE
  perhaps actually use a helper method to do the array.count search

Create a substrings array
make a substrings helper method to find all subs of length 1 or larger
    iterate from 0 to length of the string
    on each letter, iterate again from 1 to length of the word minus the index
      each iteration, use slice on the string, and slide it into a return array
return count of the substring in the substrings array
=end

def find_substrings(string)
  results = []
  length = string.size

  length.times do |index|
    (1..length-index).each { |sub_length| results << string[index, sub_length] }
  end
  results
end

def solution(str, sub)
  all_subs = find_substrings(str)
  all_subs.count(sub)
end

# Test Cases
p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1