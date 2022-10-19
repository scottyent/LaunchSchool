# String#upcase! is a destructive method,
# so why does this code print HEY you instead of HEY YOU?
# Modify the code so that it produces the expected output.

# def shout_out_to(name)
#   name.chars.each { |c| c.upcase! }

#   puts 'HEY ' + name
# end

# shout_out_to('you') # expected: 'HEY YOU'

# The reason this doesn't work as intended is that .chars is creating
# a new object, with the letters split into an array. This is not the
# same object as the original string, so the original string is not modified.

# Easiest fix is just doing name.upcase!, but if you want to stick with the
# current format a little bit:

def shout_out_to(name)
  name = name.chars.each { |c| c.upcase! }.join

  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'

# I tried to stick with the format because the last debugging question did
# but this time they took the easy way that I would have taken with name.upcase! :D


