class Human
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
  end

  # This works for the exercise but it is not recommended
  # to overreide the BasicObject#equal? method.
  def equal?(other)
    name == other.name
  end

  def +(other)
    # relies on string concatenation
    name + other.name
  end
end

gilles = Human.new("gilles")
anna = Human.new("gilles")

puts anna.equal?(gilles) #should output true #

# I don't think this is possible but it must be.
puts anna + gilles # should output annagilles