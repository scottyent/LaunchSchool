module Walkable
  def walk
    "I'm walking."
  end
end

module Swimmable
  def swim
    "I'm swimming."
  end
end

module Climbable
  def climb
    "I'm climbing."
  end
end

module Danceable
  def dance
    "I'm dancing."
  end
end

class Animal
  include Walkable

  def speak
    "I'm an animal, and I speak!"
  end
end

module GoodAnimals
  include Climbable

  class GoodDog
    include Swimmable
    include Danceable
  end

  class GoodCat < Animal; end
end

good_dog = GoodAnimals::GoodDog.new
# p good_dog.walk

# What is the method lookup path used when invoking `#walk` on `good_dog`?

# it will check:

# GoodDog -> Danceable -> Swimmable -> Climbable?? -> Animal -> Walkable -> Object -> Kernel -> BasicObject

# let's try it
p good_dog.class.ancestors

# Ah very interesting. So it doesn't check climbable, because you would only
# expect that behavior when including a module, but climbable, in this instance
# isn't included in Gooddog. However, if you include the module GoodAnimals in
# another class, it would then also have access to Climbable because it's
# included in GoodAnimals. In other words, unless a module is explicitly included
# in the class itself, it is not available in the method lookup path.