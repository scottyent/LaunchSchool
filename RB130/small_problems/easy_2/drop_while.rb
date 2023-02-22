# Recreating Enumerable#drop_while
# Takes an array and a block
# passes each element to the block
# once it gets a falsey return value, returns that element to the end of the array


# def drop_while(arr)
#   found = nil

#   arr.each_with_index do |item, index|
#     if !yield(item)
#       found = arr[index..]
#       break
#     end
#   end

#   found ? found : []
# end

# Simplified after loooking at other solutions:

def drop_while(arr)
  arr.each_with_index do |item, index|
    return arr[index..] if !yield(item)
  end
  []
end



# Test Cases
p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []