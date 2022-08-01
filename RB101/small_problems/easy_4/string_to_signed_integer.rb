def string_to_integer(string_number)
  number_array = string_number.bytes.map { |ascii_value| ascii_value - 48 }.reverse
  numerical_value = number_array.shift

  number_array.each_with_index { |number, index| numerical_value += number * (10**(index + 1)) }
  numerical_value
end

# def string_to_signed_integer(string_number)

#   if string_number.start_with?("+") || string_number.start_with?("-")
#     negative = true if string_number.start_with?("-")
#     string_number = string_number.slice(1, string_number.size - 1)
#   end

#   number_array = string_number.bytes.map { |ascii_value| ascii_value - 48 }.reverse
#   numerical_value = number_array.shift

#   number_array.each_with_index { |number, index| numerical_value += number * (10**(index + 1)) }

#   return numerical_value * -1 if negative
#   numerical_value
# end


def string_to_signed_integer(string)
  negative = true if string[0] == "-"
  result = string_to_integer(string.delete("+-"))
  negative ? -result : result
end


p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
