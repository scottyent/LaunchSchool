# Using the following code, create a class named Person with an instance variable named @secret.
# Use a setter method to add a value to @secret, then use a getter method to print @secret.

# class Person
#   def secret=(secret_text)
#     @secret = secret_text
#   end

#   def secret
#     @secret
#   end
# end

# Or, using the Ruby shortcut which is way easier (I thought they were explicitly asking to create the getter/setter methods):

class Person
  attr_accessor :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret

# Expected: Shh.. this is a secret!