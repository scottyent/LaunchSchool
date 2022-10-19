# We wrote a method for moving a given number of elements
# from one array to another. We decide to test it on our todo list,
# but invoking move on line 11 results in a SystemStackError.
# What does this error mean and why does it happen?

# Answer: this happened because we used a recursive call
# without a stopping condition. It calls forever until the
# stack is overloaded. I added in return if n == 0
# so that when n == 0 it'll stop all recursive calling.

def move(n, from_array, to_array)
  return if n == 0
  return if from_array.empty?
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

# Further exploration
# What happens if the from array is smaller than n?
# This causes the from array to empty, but the method
# still activates and puts nil in the to_array
# this is because .shift called on an empty array returns nil
# To fix this, I included a break if from_array.empty? line