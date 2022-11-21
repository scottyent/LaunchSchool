# Given:
class KrispyKreme
  attr_reader :filling_type, :glazing
  def initialize(filling_type, glazing)
    filling_type ? @filling_type = filling_type : @filling_type = "Plain"
    @glazing = glazing
  end

  def to_s
    if filling_type && glazing
      "#{filling_type} with #{glazing}"
    else
      "#{filling_type}"
    end
  end
end

# And the following specification of expected behavior:
donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
  # => "Plain"

puts donut2
  # => "Vanilla"

puts donut3
  # => "Plain with sugar"

puts donut4
  # => "Plain with chocolate sprinkles"

puts donut5
  # => "Custard with icing"

# Write additional code for KrispyKreme such that the puts statements
# will work as specified above.

# Mine works, but their approach is a little bit different:
# class KrispyKreme
#   # ... keep existing code in place and add the below...
#   def to_s
#     filling_string = @filling_type ? @filling_type : "Plain"
#     glazing_string = @glazing ? " with #{@glazing}" : ''
#     filling_string + glazing_string
#   end
# end

# At first I thought that wasn't cleaner, but it DOES restrict the logic for
# output into the to_s method, instead of doing what I did in the constructor
# depending on how that will affect your overall code/design, perhaps that's
# a better approach.
