=begin
Input: an array
Output: mutate an array (bubble sort it) so no output

Rules
You can assume there will be at least two elements

Steps:
High level:
while exchange loop
initialize a exchange variable to false
iterate from 0 to length - 2 (use as index)
  compare each element to the next element
    then using the fancy swap syntax, swap them if the left one is larger
    flag the exchange operator to true


if array[0] <=> array[1] == 1
  array[0], array[1] = array[1], array[0]
  exchange = true
end

=end

def bubble_sort!(arr)
  length = arr.size

  until length <= 1
    last_swap = 0
    (0..length - 2).each do |index|
      if (arr[index] <=> arr[index + 1]) == 1
        arr[index], arr[index + 1] = arr[index + 1], arr[index]
        last_swap = index + 1
      end
    end
    length = last_swap
  end
end

# Test Cases
array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)