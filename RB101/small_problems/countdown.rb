# def decrease(counter)
#   counter -= 1
# end

# counter = 10

# 10.times do
#   puts counter
#   decrease(counter)
# end

# puts 'LAUNCH!'

# This code doesn't work because it's trying to decrement
# a counter inside a method, and variable local scope
# along with the immutability of integers, means that
# you can't mutate the external variable from within the method
# Fixed:


counter = 10

10.times do
  puts counter
  counter -= 1
end

puts 'LAUNCH!'