# Take a look at the following code and predict the output:

a = "forty two"
b = "forty two"
c = a

puts a.object_id
puts b.object_id
puts c.object_id

# I predict that c & a will have the same object ID, but b won't

# Result: Correct - c & a had the same object ID