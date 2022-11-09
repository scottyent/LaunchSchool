# Modify the House class so that the above program will work. You are permitted to define only one new method in House.


class House
  include Comparable
  attr_reader :price

  def initialize(price)
    @price = price
  end

  def <=>(other)
    @price <=> other.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1

# Expected output
# Home 1 is cheaper
# Home 2 is more expensive

# Further Exploration
# Is the technique we employ here to make House objects comparable a good one?
# (Hint: is there a natural way to compare Houses? Is price the only criteria
# you might use?) What problems might you run into, if any? Can you think of
# any sort of classes where including Comparable is a good idea?

# I think using comparable here is a bad idea - houses have many different ways to be compared.
# While price is a big one, it could just as easily be square footage, # of bedrooms etc.
# It'd be hard to just guess what a house comparable is going to compare.

# I think there would be some classes where comparable would make sense. I can't think of any, but just
# something more concrete where you would naturally know what is being compared.