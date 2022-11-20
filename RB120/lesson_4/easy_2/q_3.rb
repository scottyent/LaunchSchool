# How do you find where Ruby will look for a method when that method is called?
# How can you find an object's ancestors?

# You can use the .ancestors method to see the method lookup chain and what
# the ancestors are. Other than that, knowledge of how Ruby usually searches
# will make it easier to guess where it's generally looking along the path.
# E.g. mixin modules get mixed into the path, but from the last added in up to
# the first added in.

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

# What is the lookup chain for Orange and HotSauce?

# For Orange -> inside orange -> inside taste -> inside Object, Kernel, BasicObject
# For HotSauce -> inside HotSauce -> inside taste -> inside Object, Kernel, BasicObject

puts Orange.ancestors
puts HotSauce.ancestors

# Correct!

