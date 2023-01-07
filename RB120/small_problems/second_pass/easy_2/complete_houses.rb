class House
  include Comparable

  attr_reader :price

  def initialize(price)
    @price = price
  end

  def <=>(other)
    price <=> other.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1

=begin
Expected output:

Home 1 is cheaper
Home 2 is more expensive

=end

# Modify the House class so that the above program will work.
# You are permitted to define only one new method in House.


# I think using this way to compare houses isn't a great idea because it's
# not really inherent that what you compare when you compare houses is the price
# It could be any number of attributes that you're comparing, so it'd be more
# appropriate to access the value you want (e.g. home1.price) and compare that
# with the built in class comparison operators (because #integer has its own)

# Can you think of any sort of classes where including Comparable is a good idea?
# Perhaps something like - bank account - if you're comparing bank accounts
# you're pretty much always talking about the balance (though perhaps not)
# NECESSARILY talking about the balances. Maybe a score class, because you want
# to always compare scores in a way that produces the "best" score, whatever
# that may be