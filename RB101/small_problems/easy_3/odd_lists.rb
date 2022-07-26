# Input: an array
# Output: an array that is made up of every other element

# def oddities(array)
#   odd_index = []
#   array.each_with_index do |item, index|
#     odd_index << item if index.even?
#   end
#   odd_index
# end


def oddities(array)
  array.select.with_index { |_, index| index.even? }
end


# Test cases
p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []