# Count method
# empty returns 0
# It's an array up to unlimited size, even though the examples aren't arrays

def count(*collection)
  collection.each_with_object([]) do |item, array|
    array << item if yield(item)
  end.size
end

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3