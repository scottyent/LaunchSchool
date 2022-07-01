advice = "Few things in life are as important as house training your pet dinosaur."

=begin
Review the String#slice! documentation, and use that method to make the return value
"Few things in life are as important as ".
But leave the advice variable as "house training your pet dinosaur.".
=end

# p advice.slice!("Few things in life are as important as ")
# p advice

# Bonus: what happens when you use slice() instead?
# It doesn't mutate the caller, but still returns the part you asked to slice
p advice.slice("Few things in life are as important as ")
p advice
