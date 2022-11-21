class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

# What would happen if we added a play method to the Bingo class,
# keeping in mind that there is already a method of this name in
# the Game class that the Bingo class inherits from.

# The play method in the bingo class would override the play method from Game,
# the superclass. This can be useful when you want custom behavior for a
# subclass that has inherited a method such as having speak mean different
# things depending on the animal.