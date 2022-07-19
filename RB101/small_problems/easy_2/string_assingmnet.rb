# What does the following code print out?

# name = 'Bob'
# save_name = name
# name = 'Alice'
# puts name, save_name

# I think it would print, Alice, then Bob - it did!

# What about this code?
name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# Hm. tough one. I think string assignment does point to the collection of CHARS, and strings are mutable in place, so it will print BOB, BOB. It did!

