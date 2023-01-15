# What will the last line of code return?

class Student
  def initialize(id, name)
    @id = id
    @name = name
  end

  def ==(other)
    self.id == other.id
  end

  protected

  attr_reader :id

  private

  attr_reader :name
end

rob = Student.new(123, "Rob")
tom = Student.new(456, "Tom")

p rob == tom

# The last line of this code with return an error, specifically a NoMethodError
# because instead of using protected, so that other instances of the class can
# access the variables, it uses private which will lock the getter away in this
# comparison scenario.

# You can fix this by moving the attr_reader for :id, to protected