# Which of the following are objects in Ruby? If they are objects,
# how can you find out what class they belong to?

true
"hello"
[1, 2, 3, "happy days"]
142

# They're all objects (although I vaguely remember something about Booleans
# maybe not being one?). You can find out by adding .class to the call

puts true.class
puts "hello".class
puts [1, 2, 3, "happy days"].class
puts 142.class


puts true.object_id
puts "hello".object_id
puts [1, 2, 3, "happy days"].object_id
puts 142.object_id

# My answer was correct!