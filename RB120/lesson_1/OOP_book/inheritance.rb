# module Walkable
#   def walk
#     "I'm walking."
#   end
# end

# module Swimmable
#   def swim
#     "I'm swimming"
#   end
# end

# module Climbale
#   def climb
#     "I'm climbing"
#   end
# end

# class Animal
#   include Walkable

#   def speak
#     "I'm an animal, and I speak!"
#   end
# end

# class GoodDog < Animal
#   include Swimmable
#   include Climbale
# end

# puts "---GoodDog method lookup---"
# puts GoodDog.ancestors
# fido = Animal.new

# puts fido.speak
# puts fido.walk

# module Mammal
# 	class Dog
# 		def speak(sound)
# 			p "#{sound}"
# 		end
# 	end

# 	class Cat
# 		def say_name(name)
# 			p "#{name}"
# 		end
# 	end
# end

# buddy = Mammal::Dog.new
# kitty = Mammal::Cat.new
# buddy.speak("Arf!")
# kitty.say_name('kitty')