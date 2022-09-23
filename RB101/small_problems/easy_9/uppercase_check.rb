# Input: String
# output: true/false depending on if all alphabetic characters (only alphabetic) are uppercase

# Algo
# chars split it apart
# Iterate through
# Match regex A-Za-z
  # Revision here: Why check for uppercase? You don't need to verify, just catch the lowers
  # So only regex match a-z and that's it
# if any that match are lowercase
# return false
# otherwise return true at the end


def uppercase?(string)
  string.chars.each do |char|
    return false if ('a'..'z').include?(char)
  end
  true
end

# Test cases
p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true