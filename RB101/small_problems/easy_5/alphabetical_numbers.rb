# Input: Array of numbers between 0-19
# Output: A sorted array of the same numbers, sorted by their english language spelling

# Rules
# You do have to sort by the full version of the English word
# for example, two and three, three comes first due to letters after t
# It doesn't specifiy if it's specifically 0..19, or just anything within that
# So we should make it flexible enough to do that

# I think the challenge here is attaching what information we get
# To something that's then sortable, and then return the numbers again

# Algo
# I'd say - create a hash that has all numbers/english words paired
# Iterate through the given array, creating a new hash with the key being the number
# and the value being the hash[number] value from that legend hash
# Sort new hash by value
# new hash keys to array

WORDS = %w(zero one two three four five six seven eight nine ten
  eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen
  nineteen)

def alphabetic_number_sort(number_array)
  # Better Solution that they gave:
  number_array.sort_by { |num| WORDS[num] }
  # input_hash = {}
  # converted_to_hash = number_array.each { |num| input_hash[num] = WORDS[num] }
  # sorted_hash = input_hash.sort_by { |_, value| value }.to_h

  # sorted_hash.keys
end


# Test Case
p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]