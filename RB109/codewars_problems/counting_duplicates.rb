=begin
Input: string
Output: integer representing the count of how many letters occur more than once


Rules
this is case insensitive
no punctuation

Steps:
Downcasethe whole string

initialize duplicates counter
chars.uniq to get only once occuring letters
iterate through
increment duplicates counter if the count of the letter in the string > 1

return counter


=end

def duplicate_count(str)
  str.downcase!
  dupe_count = 0

  str.chars.uniq.each { |letter| dupe_count += 1 if str.count(letter) > 1 }

  dupe_count
end


# Test Cases
p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2