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

# hash = { a: 'ant', b: 'bear' }
# hash.shift

# It will remove (and returns in a two-item array) the first element in the hash, so take out a: 'ant' - documentation here: https://docs.ruby-lang.org/en/3.1/Hash.html#method-i-shift

# Problem 6
# What is the return value of the following statement? Why?

['ant', 'bear', 'caterpillar'].pop.size

# return value... hm. I think it would be 11, since it would evaluate the pop which returns last object, then size
# That's true! It returns 11

# Problem 7

# What is the block's return value in the following code? How is it determined? Also, what is the return value of any? in this code and what does it output?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# I think any will return simply true, because there are odd numbers in the array and it only needs to match one thing.
# The block return value would be... true on the first run, false on the second, and true on the third.
# This is NOT what happens - any is like or, it has a circuit breaker action where once ONE thing is true, it just stops. Since the first is true
# nothing else gets executed

# Practice Problem 8

# How does take work? Is it destructive? How can we find out?

arr = [1, 2, 3, 4, 5]
arr.take(2)

# Using the docs, I can see that take returns the first number of elements from the array, and is non-destructive
# so in this example, it would return [1, 2]

# Practice Problem 9
# What is the return value of map in the following code? Why?
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# Guess here, but I think it'll return simple [nil, nil] - nope it was [nil, "bear"] because I can't count :D of course bear is larger than 3

# Practice Problem 10
# What is the return value of the following code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# I think it'll return [1, nil, nil] and it did