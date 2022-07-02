# puts "the value of 40 + 2 is " + (40 + 2)

# the error will be type error because you can't concatenate strings and integers

# and the answer was :  no implicit conversion of Integer into String (TypeError)

# Ways to fix this:

# 1. String Interpolation
puts "the value of 40 + 2 is #{(40 + 2)}"

# 2. Casting to string
puts "the value of 40 + 2 is " + (40 + 2).to_s