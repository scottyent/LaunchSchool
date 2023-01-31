class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def change_name
    self.name = name.upcase
  end
end

bob = Person.new('Bob')
p bob.name
bob.change_name
p bob.name

# In the code above, we hope to output `'BOB'` on `line 16`. Instead, we
# raise an error. Why? How could we adjust this code to output `'BOB'`?

# The reason the error is raising is because ruby thinks we're initializing
# a new local variable called `name` - we then try to upcase that variable,
# but since it was just initialized it has a value of `nil`. In order to fix
# this, we have to change name to self.name