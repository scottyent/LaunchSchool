class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

# What would you need to call to create a new instance of this class.

# You would neeed to call the class + .new, and pass in two arguments that
# represent color and material in the initialize method. Like this:

Bag.new("brown", "suede")

