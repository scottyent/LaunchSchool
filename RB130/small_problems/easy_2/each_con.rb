# recreating #each_cons
# Effectively passing into the block chunks of an array at a time
# Write one that does this 2 items at a time
# returns nil

require 'pry'
require 'pry-byebug'

def each_cons(arr)
  index = 0

  while index <= arr.size - 2
    yield(arr[index, 2])
    index += 1
  end

  nil
end

# Test Cases

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil