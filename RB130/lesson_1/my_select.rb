def my_select(array)
  counter = 0
  selected_array = []

  while counter < array.size
    result = yield(array[counter])
    selected_array << array[counter] if result
    counter += 1
  end

  selected_array
end

array = [1, 2, 3, 4, 5]

p array.select { |num| num.odd? } == my_select(array) { |num| num.odd? }     # => [1, 3, 5]
p array.select { |num| puts num } == my_select(array) { |num| puts num }       # => [], because "puts num" returns nil and evaluates to false
p array.select { |num| num + 1 }  == my_select(array) { |num| num + 1 }      # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true