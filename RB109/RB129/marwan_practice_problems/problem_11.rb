#11 — What would cat.name return after the last line of code is executed?

class Cat
  attr_accessor :name

  def set_name
    name = "Cheetos"
  end
end

cat = Cat.new
cat.set_name
p cat.name

# It should return nil because in order to set an instance variable like that
# you have to either write @variable_name or self.variable_name. This doesn't
# so it's basically just initiating a new local variable called name instead
# of actually working with the instance variable as intended.