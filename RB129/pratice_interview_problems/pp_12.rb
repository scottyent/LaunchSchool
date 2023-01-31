class Person
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end
end

class Pet
  def jump
    puts "I'm jumping!"
  end
end

class Cat < Pet; end

class Bulldog < Pet; end

bob = Person.new("Robert")

kitty = Cat.new
bud = Bulldog.new

bob.pets << kitty
bob.pets << bud

bob.pets.each { |pet| pet.jump }

# We raise an error in the code above. Why? What do `kitty` and `bud`
# represent in relation to our `Person` object?

# The issue is that you're calling an instance method on an array of pets, rather
# than on the individual pet as intended. I fixed this by creating a loop to call
# jump on each individual pet object in the array of pets.