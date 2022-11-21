# Given this:

class Game
  def play
    "Start the game!"
  end
end

# and this

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

# What can we add to the Bingo class to allow it to inherit the play
# method from the Game class?

# Added in the < with Game to the right to signify inheritance

puts Bingo.new.play