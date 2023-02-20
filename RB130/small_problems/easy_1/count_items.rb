# Write a counting method that takes a collection and a block that will
# return either true or false. True increments the counter, and at the end
# it returns the count.

# def count(collection)
#   count = 0

#   collection.each { |item| count += 1 if yield(item) }

#   count
# end

# Further Exploration - write this without each, loop, while, or until

def count(collection)
  collection.select { |item| yield(item) }.size
end

# Test cases
p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2