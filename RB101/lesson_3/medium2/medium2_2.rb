# Let's take a look at another example with a small difference in the code:

a = 42
b = 42
c = a

puts a.object_id
puts b.object_id
puts c.object_id

# Hm. I'm not sure here. I would think the answer is the same, but I vaguely
# remember about something working differently with integers. I googled it
# and that hunch was correct! Integers have a fixed object ID and point to the same thing

# Answer from the page says this has to do with the immutability of Integers (same with true, false, nil)

# Result: All have the same object ID