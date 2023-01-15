#6 — Will the following code execute? What will be the output?

class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
     "Hello! they call me #{name}"
  end
end

class Puppet < Person
  def initialize(name)
    super
  end

  def greet(message)
    puts super() + message
  end
end

puppet = Puppet.new("Cookie Monster")
puppet.greet(" and I love cookies!")

# Yes, I belive this will execute and do what we expect.
# The output would be "Hello! they call me Cookie Monster and I love cookes!"

# Welp, I was wrong. By calling super within the greet instance method for Puppet
# it automatically passes all arguments, which doesn't make sense because the
# inherited #greet method doesn't take any arguments. In order to fix this,
# we would have to explicitly call super()