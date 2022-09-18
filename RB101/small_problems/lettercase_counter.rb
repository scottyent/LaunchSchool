# Input: a string
# Output: a hash the counters for the amount of lowercase, uppercase, or neither letters

# Algo
# Break string apart to an array using chars
# Initialize a hash with zero for all counters
# iterate through the array
# call .ord on each item, and decide which category it should be on based on that
# increment the hash counters
# return the hash

def letter_case_count(string)
  string_array = string.chars
  result = { lowercase: 0, uppercase: 0, neither: 0 }

  string_array.each do |character|
    ascii_value = character.ord
    case ascii_value
    when 65..90
      result[:uppercase] += 1
    when 97..122
      result[:lowercase] += 1
    else
      result[:neither] += 1
    end
  end

  result
end


# Test cases
p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }