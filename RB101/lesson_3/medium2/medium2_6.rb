def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

# How could the following method be simplified without changing its return value?

# def color_valid(color)
#   %w(blue green).include?(color) ? true : false
# end

# Real answer:
def color_valid(color)
  color == "blue" || color == "green"
end

p color_valid("blue")