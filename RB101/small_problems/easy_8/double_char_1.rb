# Input: String
# Outpit: New string with every character is doubled

# Rules
# Empty string returns empty string

# Algo
# Initialize new string
# Split to chars to iterate over
# shovel character * 2 into the new char
# Return char
# How will this work with an empty string? - yes

def repeater(string)
  string.chars.each_with_object(String.new) do |char, string|
    string << char * 2
  end
end



# Test cases
p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''