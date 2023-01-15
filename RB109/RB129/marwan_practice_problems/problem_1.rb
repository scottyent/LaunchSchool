# What will the following code output? Why?

class Student
  attr_reader :id

  def initialize(name)
    @name = name
    @id
  end

  def id=(value)
    self.id = value
  end
end

tom = Student.new("Tom")
tom.id = 45

# The reason this causes an error is it's basically calling itself. self.id
# is calling the setter method for @id, but it's calling it within the actual
# setter method itself, so it will recursively call forever causing a SystemStackError