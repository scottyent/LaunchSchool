=begin
Input: string of digits
Output: an integer representing the largest possible product of 5 digits

Rules
input must always have more than 5 digits

Steps:
create find_substrings_of_5 helper method :DONE
inside, iterate first from the first letter, up to the the length - 5
take a slice from index to length of 5 and put it in the results

I maintain strings in that method


then I initialize a variable of array that is products empty
current_product = 0
then i iterate over the subs
then iterate over the chars, *= the current product
then shove it into the products array and zero it again

finally, products.max
=end

def find_int_subs_of_5(str)
  (0..str.length - 5).map { |index| str[index, 5] }
end


def greatest_product(num_string)
  all_ints_of_5 = find_int_subs_of_5(num_string)

  # I could have changes the block here into a one liner, but I think
  # it would really hurt readability
  products = all_ints_of_5.map do |group|
    current_product = []
    group.chars { |char| current_product << char.to_i }
    current_product.inject(:*)
  end

  products.max
end

# Test Cases
p greatest_product("123834539327238239583") ==  3240
p greatest_product("395831238345393272382") ==  3240
p greatest_product("92494737828244222221111111532909999")  ==  5292
p greatest_product("92494737828244222221111111532909999") ==  5292
p greatest_product("02494037820244202221011110532909999") ==  0