# Recreate each_with_index
# loops through an array, and passes each element w/ index to a block, returns the
# original array

def each_with_index(arr)
  index = 0

  while index < arr.size
    yield(arr[index], index)
    index += 1
  end

  arr
end


# Test Cases

result = each_with_index([1, 3, 6]) do |vsalue, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]

# 0 -> 1
# 1 -> 3
# 2 -> 36
# true