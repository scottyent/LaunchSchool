# Write a program that manages robot factory settings.

# When robots come off the factory floor, they have no name. The first time you
# boot them up, a random name is generated, such as RX837 or BC811.

# Every once in a while, we need to reset a robot to its factory settings, which
# means that their name gets wiped. The next time you ask, it will respond with
# a new random name.

# The names must be random; they should not follow a predictable sequence.
#  Random names means there is a risk of collisions. Your solution should not
#  allow the use of the same name twice.

# Input: Nothing. just a call to Robot.new.name instance method name
# Output: a new name of the format 2 letters and 3 numbers

# Rules
# Explicit:
# * Reset is another instance method that assigns a new random name
# * the same name cannot be used twice (for example when reset)
# Implicit:
# * Letters are uppercase
# * strings are used as the name

# Algorithm:
# I think this is pretty straight forward.
# * iniitialize with a name variable, and have a assign_name function create
# the name. Make a reader so that the tests can access the name.
# Within the assign name, randomly generate and add 2 letters, then 3 numbers
# to a result, and return it.
# * to make sure it's not duplicating the name, loop in one loop that is do
# until result != name

# I missed the same name collisions as it appears this is supposed to carry
# between all instances, which is the perfect use of a class variable!

class Robot
  attr_reader :name

  @@used_names = []

  LETTER = ("A".."Z").to_a
  NUMBER = (0..9).to_a.map(&:to_s)

  def initialize
    @name = assign_name
  end

  def assign_name
    result = ""

    while result.empty? || result == name || @@used_names.include?(result)
      result = ""
      2.times { |_| result << LETTER.sample }
      3.times { |_| result << NUMBER.sample }
    end

    @@used_names << result

    result
  end

  def reset
    @name = assign_name
  end
end
