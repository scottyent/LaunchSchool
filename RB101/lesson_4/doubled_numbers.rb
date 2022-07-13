# Input: array of numbers
# Output: array of those numbers, doubled, but this time arround the goal is to mutate the original
# Algo
# Loop through like before, but instead of implementing a new array, just set the index you're on equal to the result of doubling the number

def multiply_numbers(numbers, multiplier)
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    numbers[counter] = (current_number * multiplier)

    counter += 1
  end

  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
multiply_numbers(my_numbers, 3) # => [2, 8, 6, 14, 4, 12]
p my_numbers