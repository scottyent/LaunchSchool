# Input: a string
# Output: a hash with the percentages of upper, lower, and neither as values

# Rules
# String will always contain at least one character
# float is the percentages

# Algo
# Initialize hash
# using count and patterns - create count of lowers
# count of uppers
# count of neither
# intitialize total length
# then set the values for the hashes accordingly

def letter_percentages(str)
  total_count = str.size.to_f
  lower_percent = (str.count('a-z') / total_count) * 100
  upper_percent = (str.count('A-Z') / total_count) * 100
  neither_percent = (str.count('^A-Za-z') / total_count) * 100

# Further exploration, format to one decimal place, added .round
  percentages = {
    lowercase: lower_percent.round(1),
    uppercase: upper_percent.round(1),
    neither: neither_percent.round(1)
  }
end

# Test Cases
p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI')