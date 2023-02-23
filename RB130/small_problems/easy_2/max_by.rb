# Recreate #max_by
# should take an array, and return the largest element in it
# return nil if it's empty

def max_by(arr)
  max = nil
  arr.each do |item|
    if max == nil || yield(item) > yield(max)
      max = item
    end
  end

  max
end

# Test Cases

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil