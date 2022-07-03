# What will be printed by each of these code groups?

# def mess_with_vars(one, two, three)
#   one = two
#   two = three
#   three = one
# end

# one = "one"
# two = "two"
# three = "three"

# mess_with_vars(one, two, three)

# puts "one is: #{one}"
# puts "two is: #{two}"
# puts "three is: #{three}"

=begin
I made an incorrect guess and the result was:
one is: one
two is: two
three is: three

... wait. there's no modification going on, right? what's happening in the method isn't mutating, and it's just variable shadowing so the original set values are true,
that's what's going on here.
=end

# def mess_with_vars(one, two, three)
#   one = "two"
#   two = "three"
#   three = "one"
# end

# one = "one"
# two = "two"
# three = "three"

# mess_with_vars(one, two, three)

# puts "one is: #{one}"
# puts "two is: #{two}"
# puts "three is: #{three}"

=begin
I think the same as above, nothing is really being modified. Assignment isn't mutating. So it'll just print one is one, two is two, three is three

Result: Correct!
=end

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

=begin
Ok here we are mutating, and so it will act as if it's pass by reference.

this turns one -> "two"
then two -> "three"
then three -> "one"

so it'll print

One is two
two is three
three is one.

Result: Correct!
=end

# There were no official explanations at the end of this, just the answers