# When attempting to sort an array of various lengths, we are surprised to see
# that an ArgumentError is raised. Make the necessary changes to our code so
# that the various lengths can be properly sorted and line 62 produces the
# expected output.

class Length
  include Comparable

  attr_reader :value, :unit

  def initialize(value, unit)
    @value = value
    @unit = unit
  end

  def as_kilometers
    convert_to(:km, { km: 1, mi: 0.6213711, nmi: 0.539957 })
  end

  def as_miles
    convert_to(:mi, { km: 1.609344, mi: 1, nmi: 0.8689762419 })
  end

  def as_nautical_miles
    convert_to(:nmi, { km: 1.8519993, mi: 1.15078, nmi: 1 })
  end

  def <=>(other)
    self.as_miles.value <=> other.as_miles.value
  end

  # def ==(other)
  #   case unit
  #   when :km  then value == other.as_kilometers.value
  #   when :mi  then value == other.as_miles.value
  #   when :nmi then value == other.as_nautical_miles.value
  #   end
  # end

  # def <(other)
  #   case unit
  #   when :km  then value < other.as_kilometers.value
  #   when :mi  then value < other.as_miles.value
  #   when :nmi then value < other.as_nautical_miles.value
  #   end
  # end

  # def <=(other)
  #   self < other || self == other
  # end

  # def >(other)
  #   !(self <= other)
  # end

  # def >=(other)
  #   self > other || self == other
  # end

  def to_s
    "#{value} #{unit}"
  end

  private

  def convert_to(target_unit, conversion_factors)
    Length.new((value / conversion_factors[unit]).round(4), target_unit)
  end
end

# Example

puts [Length.new(1, :mi), Length.new(1, :nmi), Length.new(1, :km)].sort
# => comparison of Length with Length failed (ArgumentError)
# expected output:
# 1 km
# 1 mi
# 1 nmi

# Alright, I solved this but kind of cheated by using comparable and the
# spaceship operator. Tomorrow, work on figuring out why the existing code
# didn't work

# I was looking it over, but realized sort uses <=> which is why it
# wasn't working before, and so I think my solution is still fine.
# The LS solution is that they basically copied over the ==(other)
# method but instead for the <=> operator. I prefer just calculating
# to one unit and comparing, but they made a case statement.