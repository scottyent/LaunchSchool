class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def self.hi
    greetings = Greeting.new
    greetings.greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# If we call Hello.hi we get an error message. How would you fix this?
# Just change the hi method to self.hi to make it a class method. That did NOT
# solve it because it can't call greet. Change greet to a class method too.
# That works, but their solution makes more sense by creating a greeting
# instance inside the self.hi method.
Hello.hi


