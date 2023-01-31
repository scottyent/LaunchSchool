class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end


sparky = GoodDog.new('Spartacus', '12 inches', '10 lbs')
sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info
# => Spartacus weighs 10 lbs and is 12 inches tall.

#  We expect the code above to output `”Spartacus weighs 45 lbs and is 24
# inches tall.”` Why does our `change_info` method not work as expected?

# The change_info instance method is not working correctly because of the way
# that variables are listed. Without using self, or @, ruby thinks we're
# initializing a new local variable within the method. In order to fix this,
# I'm going to change it to self. for each item, as that's the best practice
# for setters