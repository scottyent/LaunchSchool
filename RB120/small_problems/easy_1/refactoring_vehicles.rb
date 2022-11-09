# Refactor these classes so they all use a common superclass, and inherit behavior as needed.

class Vehicle
  attr_reader :make, :model
  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end

  def wheels
    self.class::NUM_WHEELS
  end
end

class Car < Vehicle
  NUM_WHEELS = 4
end

class Motorcycle < Vehicle
  NUM_WHEELS = 2
end

class Truck < Vehicle
  NUM_WHEELS = 6
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end
end

tonka = Truck.new("Ford", "F150", 150)
rocket = Motorcycle.new("Kawasaki", "Ninja")
eve = Car.new("Tesla", "Model 3")

puts tonka.wheels
puts rocket.wheels
puts eve.wheels

puts tonka
puts rocket
puts eve

# Further Exploration
# Would it make sense to define a wheels method in Vehicle even though all of the remaining classes would be overriding it? Why or why not? If you think it does make sense, what method body would you write?
# I thought about this already a bit as I was trying to consolidate it in, but without having to necessarily have another parameter passed in at initialization. The didn't work out. If these things don't change
# then I think it's safe to leave it in the class itself, but I did go ahead and make a constant at the top that highlights the amount of wheels each class has.

# I found through another students solution the very clever option of doing self.class::NUM_WHEELS to access the constants from within the other classes, allowing you to consolidate all into one wheels function in Vehicle