# Input: positive integer
# Output: A right triangle (bottom and side hsa same number of elements), with corners in the bottom left and upper right

# Algo
# create starting array, with one * on the right, the size of the number
# puts that, then change the index -2 to a star, then index minus 3 then index minus 4
# until the absolute index is equal to the size of the array

# def triangle(n)
#   row = ' ' * n
#   asterisk_insert = -1

#   n.times do |_|
#     row[asterisk_insert] = '*'
#     asterisk_insert -= 1
#     puts row
#   end
# end

# def triangle_upside_down(n)
#   row = '*' * n
#   space_insert = 0

#   n.times do |_|
#     row[space_insert] = ' '
#     space_insert += 1
#     puts row
#   end
# end

def triangle(n, upside_down=false)
  symbols = [' ', '*']
  insert_point = [-1, 0]
  if upside_down
    symbols.reverse!
    insert_point.reverse!
  end

  row = symbols[0] * n
  item_insert = insert_point[0]

  n.times do |_|
    row[item_insert] = symbols[1]
    upside_down ? item_insert += 1 : item_insert -= 1
    puts row
  end
end

triangle(5)
triangle(9)

triangle(5, true)
triangle(9, true)

# triangle_upside_down(5)
# triangle_upside_down(9)