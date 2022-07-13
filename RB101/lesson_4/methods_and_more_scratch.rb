# What would this return?

# [1, 2, 3].select do |num|
#   num > 5
#   'hi'
# end

# Returns an arary with the original values, because the block will always return a true value due to "hi" being at the end and truthy, and truthy means put that value in the new array
# Output: [1, 2, 3]

# Problem 2

# How does count treat the block's return value? How can we find out?

# example = ['ant', 'bat', 'caterpillar'].count do |str|
#   str.length < 4
# end

# # I looked in the documentation here: https://docs.ruby-lang.org/en/3.1/Enumerable.html#method-i-count
# # And saw that if a block is given, it evaluate the block for truthiness, and return the number of elements that match that condition. Like select, but with counting
# p example

# Problem 3

# What's the return value of reject in the following code? Why?

# [1, 2, 3].reject do |num|
#   puts num
# end

# This would return an array with [1, 2, 3] because reject is the opposite of select, it's looking for false or nil as the qualifier, and puts always returns nil

# Problem 4
# What is the return value of each_with_object in the following code? Why?

# ['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
#   hash[value[0]] = value
# end

# Tough one - I think a Hash with the following structure { 'a'=> 'ant, 'b'=> 'bear', 'c'=>'cat'}
# That is exactly correct!

# Problem 5
# What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
hash.shift

# It will remove (and returns in a two-item array) the first element in the hash, so take out a: 'ant' - documentation here: https://docs.ruby-lang.org/en/3.1/Hash.html#method-i-shift
