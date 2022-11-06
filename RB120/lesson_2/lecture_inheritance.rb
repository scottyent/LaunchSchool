# Create a sub-class from Dog called Bulldog
# overriding the swim method to return "can't swim!"

# 2 Added in a bunch of methods for the Dog class. Then:
# Create a new class called Cat, which can do everything a dog can,
# except swim or fetch. Assume the methods do the exact same thing.

class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Pet
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Cat < Pet
  def speak
    'Meow!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end


# teddy = Dog.new
# puts teddy.speak           # => "bark!"
# puts teddy.swim           # => "swimming!"

# bull_teddy = Bulldog.new
# puts bull_teddy.swim
# puts bull_teddy.speak

pete = Pet.new
kitty = Cat.new
dave = Dog.new
bud = Bulldog.new

p pete.run                # => "running!"
# p pete.speak              # => NoMethodError

p kitty.run               # => "running!"
p kitty.speak             # => "meow!"
# p kitty.fetch             # => NoMethodError

p dave.speak              # => "bark!"

p bud.run                 # => "running!"
p bud.swim                # => "can't swim!"

# 3 Draw a hierarchy diagram
# https://app.diagrams.net/#G1HOjlg1gEIFw0xWWGEUiKlD8hhLFdo44z

# 4 What is the method lookup path and how is it important?
=begin
the method lookup path is the order of where the program searches for
a particular method. This is very important because it allows us to understand
where a method is being called from, and also allows us to override methods from higher
up in the chain. For example, if we had a speak function in the superclass, but wanted
the subclass to say something slightly different, thanks to the method lookup path, it will
call the method from that subclass instead of searching upwards and calling the original in
the superclass.

It's also important because we're not just talking about classes here, this can
involve including mixin modules, which would alter the path of the method lookup
=end