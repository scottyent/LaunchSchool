# Input: an array of strings that are numbers
# Output: a sorted array, sorted by numberic value, not string value (whoops - reverse sort from big to small)

arr = ['10', '11', '9', '7', '8']

reverse_sort = arr.sort do |first, second|
  second.to_i <=> first.to_i
end

p reverse_sort