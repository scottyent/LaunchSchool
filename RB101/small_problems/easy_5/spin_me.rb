def spin_me(str)
  puts str.object_id
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

word = spin_me("hello world") # "olleh dlrow"
puts word.object_id

# Question is - will the object be the same object that was put in
# I would say it's a new object, because split breaks this apart into an array
# And while they're both mutable, strings are stored as a grouping of chars
# And so it points to the beginning part of the string. If you blast it apart
# To create an array, you're creating new object IDs.
# Then you modify those in place, and join them back to once again, form a new string with a new object ID.

