# Class methods

# class GoodDog
#   DOG_YEARS = 7
#   @@number_of_dogs = 0

#   attr_accessor :name, :age

#   def self.what_am_i
#     "I'm a GoodDog class!"
#   end

# 	def initialize(n, a)
# 		self.name = n
#     self.age = a * DOG_YEARS
#     @@number_of_dogs +=1
# 	end

#   def self.total_number_of_dogs
#     @@number_of_dogs
#   end

#   def speak
#     "#{name} says arf!"
#   end

#   def change_info(n, a)
#     self.name = n
#     self.age = a
#   end

#   def to_s
#     "The dogs name is #{name} and it is #{age} in dog years."
#   end
# end

# fido = GoodDog.new("Fido", 5)
# puts fido.inspect

# Investigating self

# class GoodDog
#   attr_accessor :name, :height, :weight

#   puts self

#   def initialize(n, h, w)
#     self.name = n
#     self.height = h
#     self.weight = w
#   end

#   def change_info(n, h, w)
#     self.name = n
#     self.height = h
#     self.weight = w
#   end

#   def info
#     "#{self.name} weighs #{self.weight} and is #{self.height} tall"
#   end

#   def what_is_self
#     self
#   end
# end
