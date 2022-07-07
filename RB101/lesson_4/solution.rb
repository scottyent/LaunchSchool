
def sum_even_number_row(row_number)
  rows = []
  current_integer = 2
  (1..row_number).each do |current_row_number|
    rows << create_row(current_integer, current_row_number)
    current_integer = rows.last.last + 2
  end
  rows.last.sum
end

# Create Row Algo
# 1. Create an empty row array to contain the integers
# 2. Add the starting integers
# 3. Increment the starting integer by 2 to get the next integer in the sequence
# 4. Repeat steps 2 & 3 until the array has reached the correct length
# 5. Return the row array

def create_row(start_integer, row_length)
  row = []
  current_integer = start_integer
  while row.size < row_length
    row << current_integer
    current_integer += 2
  end
  row
end

# The way that the video solves it is with a different loop:
# def create_row(start_integer, row_length)
#   row = []
#   loop do
#     row << start_integer
#     start_integer += 2
#     break if row.size == row_length
#   end
#   row
# end

# Tests for the main problem (sum_even_number_row):
# row number: 1 --> sum of integers in row: 2
# row number: 2 --> sum of integers in row: 10
# row number: 4 --> sume of integers in row: 68

p sum_even_number_row(1) == 2
p sum_even_number_row(2) == 10
p sum_even_number_row(4) == 68

# Tests for the helper function (create_row):
# start: 2, length: 1 --> [2]
# start: 4, length: 2 --> [4, 6]
# start: 8, length: 3 --> [8, 10, 12]

# p create_row(2, 1) == [2]
# p create_row(4, 2) == [4, 6]
# p create_row(8, 3) == [8, 10, 12]

