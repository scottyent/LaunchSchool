a = %w(a b c d e)
# puts a.fetch(7)
puts a.fetch(7, 'beats me')
puts a.fetch(7) { |index| index**2 }

# My guesses:
# I imagine just a nil since it's out of range INCORRECT: It returns an index error, because that's the entire reason for using fetch in the first place
# 'beats me' since it's the default value if out of range - CORRECT
# 49 - CORRECT

