# Write a method that takes an optional block. If the block is specified,
# the method should execute it, and return the value returned by the block.
# If no block is specified, the method should simply return the String
# 'Does not compute.'.

def compute(item)
  return yield(item) if block_given?
  "Does not compute."
end




# Test cases
# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'

# Test cases further exploration
p compute(5) { |num| num + 3 } == 8
p compute('a') { |letter| letter + 'b' } == 'ab'
p compute(42) == 'Does not compute.'