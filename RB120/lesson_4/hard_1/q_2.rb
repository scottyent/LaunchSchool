# Building on the prior vehicles question, we now must also track a basic
# motorboat. A motorboat has a single propeller and hull, but otherwise
# behaves similar to a catamaran. Therefore, creators of Motorboat instances
# don't need to specify number of hulls or propellers. How would you modify
# the vehicles code to incorporate a new Motorboat class?

module Moveable
  attr_accessor :speed, :heading
  attr_writer :fuel_capacity, :fuel_efficiency

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class WheeledVehicle
  include Moveable

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Boat
  include Moveable

  attr_reader :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    @propeller_count = num_propellers
    @hull_count = num_hulls
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end
end


class Catamaran < Boat
end

class Motorboat < Catamaran
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    super(1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
  end
end


tuggy = Motorboat.new(50, 2)
p tuggy

catty = Catamaran.new(2, 2, 100, 5)
p catty

# so since a motorboat is a simpler catamaran, I inherited from the catamaran
# and used super to call the same initialize method but with fixed values for
# the hull and propeller count

# so far enough, the solution is to create a seacraft superclass, and have
# Motorboat and Catamaran both inherit. While this is more code, I do think
# it's a little cleaner logically speaking as a motorboat isn't a type of
# catamaran. Refactored my solution.