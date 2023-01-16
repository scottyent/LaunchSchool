#14 — Write 3 methods inside the Person class that would return the outputs
# shown on lines 23 and 24.

class Person
  attr_reader :friends

  def initialize
    @friends = []
  end

  def <<(friend)
    @friends << friend.name
  end

  def []=(index, friend)
    @friends[index] = friend.name
  end

  def [](index)
    @friends[index]
  end
end

class Friend
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

tom = Person.new
john = Friend.new('John')
amber = Friend.new('Amber')

tom << amber
tom[1] = john
p tom[0]      # => Amber
p tom.friends # => ["Amber", "John"]