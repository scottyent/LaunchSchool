#12 — What will the last two lines of code output?

module Walk
  STR = "Walking"
end

module Run
  STR = "Running"
end

module Jump
  STR = "Jumping"
end

class Bunny
  include Jump
  include Walk
  include Run
end

class Bugs < Bunny; end

p Bugs.ancestors
p Bugs::STR

# My guess is that the first line will produce...
# Bugs -> Bunny -> run -> walk -> jump -> Object -> Kernel -> BasicObject

# 2nd line, `running`