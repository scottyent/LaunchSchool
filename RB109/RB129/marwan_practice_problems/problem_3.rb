#3 — What concept does the following code aim to demonstrate?

module Greet
  def greet(message)
    puts message
  end
end

class Teacher
  include Greet
end

class Student
  include Greet
end

tom = Teacher.new
rob = Student.new

tom.greet "Bonjour!"
rob.greet "Hello!"


# This code is demonstrating the concept of polymorphism using module mixins.
# This means that despite the fact that the `tom` and `rob` objects are
# instantiated from completely different classes, they respond to the same `#greet`
# interface. Using the mixin Greet, a developer can include this in any class
# they want to have this function, and know that regardless of underlying
# implementation, the object will respond to that method call.
