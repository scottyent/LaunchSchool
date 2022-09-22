# Input: non empty string
# Output:  the middle character or characters

# Rules
# If the length is odd, return 1 character
# If even, return middle two

# Algo
# store length
# If odd, just length divided by 2 let integer division chop of the eend, and use that as index
# if even, take string[half.length - 1] + string[ half length]

def center_of(string)
  string_half = string.size / 2
  odd_middle = string[string_half]

  string.size.odd? ? odd_middle : string[string_half - 1] + odd_middle
end

# Test Cases
p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'