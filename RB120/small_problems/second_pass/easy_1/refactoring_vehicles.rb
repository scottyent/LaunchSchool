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
    self.class::WHEELS
  end
end

class Car < Vehicle
  WHEELS = 4
end

class Motorcycle < Vehicle
  WHEELS = 2
end

class Truck < Vehicle
  WHEELS = 6

  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end
end

# Refactor these classes so they all use a common superclass, and inherit
# behavior as needed.

eve = Car.new("Tesla", "Model 3")
vroom = Motorcycle.new("Kawasaki", "Fast thing")
tonka = Truck.new("Ford", "F150", "1 billion pounds")

p eve
p vroom
p tonka

puts eve.wheels
puts vroom.wheels
puts tonka.wheels