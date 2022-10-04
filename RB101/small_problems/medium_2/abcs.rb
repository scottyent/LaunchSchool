# Input: A word as a string
# Output: boolean depending on whether it can be spelled given the parameters

# Rules
# implicit - based on test cases, not case sensitive
# Can only use one letter from each pair
# Each block can only be used once
# Do the keys and values only occur once each? - based on the block, yes

# Algo
# I would say, iterate over the chars
# When there is a match against the blocks
# continue, but modify the blocks
# then change the bocks to select only unmodified blocks
# and if there isn't a match, return false
# So the question is - what data structure.
# Ok - dictionary...
# check if char.upcase key or value exists, return false if otherwise
# if it does exist, then use that to set the value of that block to false
# change block to now equal all items that don't have value of false

# I went down the dictionary route and I just don't see it as particularly
# beneficial. I think I'll be better off with nested arrays, particularly
# because flatten.include woudl be really easy

#
def block_word?(word)
  block = [["B", "O"], ["X", "K"], ["D", "Q"], ["C", "P"], ["N", "A"],
  ["G", "T"], ["R", "E"], ["F", "S"], ["J", "W"], ["H", "U"],
  ["V", "I"], ["L", "Y"], ["Z", "M"]]
  result = true
  word.upcase!

  word.chars.each do |letter|
    if block.flatten.include?(letter)
      block.reject! { |set| set.include?(letter) }
    else
      result = false
    end
  end

  result
end

# Test Cases
p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jesp') == true