# Given this code:
class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# What happens in each of the following cases:

# 1
# hello = Hello.new
# hello.hi
# This will display "Hello"
# Correct!

# 2
# hello = Hello.new
# hello.bye
# NoMethodError - bye exists in the GoodBye class, which also inherits from
# Greeting, but this is an instance of the Hello class which doesn't have
# access to that method.
# Correct!

# 3
# hello = Hello.new
# hello.greet
# ArgumentError - wrong nnumber of arguments - you're giving 0 but there should
# be one
# Correct!

# 4
# hello = Hello.new
# hello.greet("Goodbye")
# Displays "Goodbye"
# Correct!

# 5
Hello.hi
# NoMethodError - this is being called as a class method, but defined as an
# instance method.
# Correct!
