# What will the following code print and why?

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# I would say that it prints the original array copy, because assigning values into array2 actually creates a copy. I was wrong

array1 << "bro"
puts array1
