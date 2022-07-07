# word = "Potato"
# puts word[3, 2]
# puts word.slice(3, 2)

# How would you reference 'grass' from within this string? Try it out in irb.
# str = 'The grass is green'

# puts str[4, 5]

# # What do you think would be returned here?
# arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
# p arr[2, 3]
# p arr[2, 3][0]

# str = "joe's favorite color is blue"
# str[0] = 'J'

# How can you upcase the rest of the words?
# A few ways
# str[6] = "F"
# str[15] = "C"
# str[-4] = "B"
# str[-7] = "I"

# array_word = str.split
# array_word.each do |word|
#   word.capitalize!
# end

# capitalized = array_word.join(" ")

# p capitalized

# hsh = { apple: 'Produce', carrot: 'Produce', pear: 'Produce', broccoli: 'Produce' }
# hsh[:apple] = 'Fruit'

# hsh.each do |k, v|
#   hsh[k] = %w(fruit vegetable).sample
# end

# p hsh

# def sum_even_rows(row_number)
#   result = 0
#   (2..(row_number * 2)).each do |num|
#     result += num if num.even?
#   end
#   result
# end

# p sum_even_rows(50)

def number_of_elements(row_number)
  num_elements = 0
  while row_number >= 0
    num_elements += row_number
    row_number -= 1
  end
  num_elements
end

def create_element_array(row)
  element_count = number_of_elements(row) * 2
  even_array = []
  (2..element_count).each do |num|
    even_array.append(num) if num.even?
  end
  even_array
end

def create_nested_array(even_array)
  row_size = 1
  nested_array = []
  while row_size <= even_array.size
    nested_array << even_array.shift(row_size)
    row_size += 1
  end
  nested_array
end

def sum_even_rows(row_input)
  even_array = create_element_array(row_input)
  nested_array = create_nested_array(even_array)
  sum = nested_array[row_input - 1].sum
end

p sum_even_rows(2)

