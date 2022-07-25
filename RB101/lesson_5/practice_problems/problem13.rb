arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

test_result = [[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]

result = arr.sort_by do |array|
  array.select { |numbers| numbers.odd? }
end

p result == test_result

