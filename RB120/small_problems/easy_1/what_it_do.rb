# What will the following code print?

class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new
puts Something.dupdata
puts thing.dupdata

# First puts would call the class method (last one defined), and print ByeBye
# Then the second one would call the instance method, and print "HellloHello"