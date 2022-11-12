# I'm going to attempt describing the gameplay myself before using their example.
# Rock paper scissor is a game where each player chooses either rock, paper, or scissor.
# The two choices are then compared using the game logic for what beats what, and then
# a winner is declared.

# Ok, I would say it's relatively similar to their description, they were just more
# explicit on the actual game logic:

# Rock, Paper, Scissors is a two-player game where each player chooses
# one of three possible moves: rock, paper, or scissors. The chosen moves
# will then be compared to see who wins, according to the following rules:

# - rock beats scissors
# - scissors beats paper
# - paper beats rock

# If the players chose the same move, then it's a tie.

# Again, I'm going to try to extract the nouns myself without looking at the answer:
# player, computer, rock paper scissor?...
# Their answer:
# Nouns: player, move, rule
# Verbs: choose, compare

# - I have no idea how they got that. Move is a verb? but I guess it's a state describing
# what choice was made, so includes rock/paper/scissor. Rule? Idk what that means. Maybe the
# hardcoded state of what the rules are?

# Now we compare the nouns to the verbs and fit them where they belong:
# Player
#  - choose
# Move
# Rule

# - compare

# compare wasn't obvious where to go so they left it separate. Alright. Let's attempt
# to code the basics here.

require 'pry'
require 'pry-byebug'

class Player
  attr_accessor :move, :name

  def initialize
    @name = set_name
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "That's not a valid name."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, or scissors:"
      choice = gets.chomp
      break if ["rock", "paper", "scissors"].include?(choice)
      puts "Invalid choice."
    end
    self.move = choice
  end
end

class Computer < Player
  def set_name
    self.name = %w(Ultron Dominator Hal Chappie R2D2).sample
  end

  def choose
    self.move = ["rock", "paper", "scissors"].sample
  end
end

# We need an orchestration engine - whatttt? This is interesting :D
# Basically a class to... run the game flow? Kind of like, the outer logic
# in the procedural flow we've been doing

class RPSgame
  attr_accessor :human, :computer
  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end

  def play_again?
    loop do
      puts "Do you want to play again?(y/n)"
      choice = gets.chomp.downcase
      return true if %w(y yes).include?(choice)
      return false if %w(n no).include?(choice)
      puts "I'm sorry, that's not a valid choice."
    end
  end
  def display_winner
    divider
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"

    case human.move
    when 'rock'
      puts "It's a tie!" if computer.move == 'rock'
      puts "#{human.name} wins!"    if computer.move == 'scissors'
      puts "#{computer.name} wins."   if computer.move == 'paper'
    when 'paper'
      puts "It's a tie!" if computer.move == 'paper'
      puts "#{human.name} wins!" if computer.move == 'rock'
      puts "#{computer.name} wins." if computer.move == 'scissors'
    when 'scissors'
      puts "It's a tie!" if computer.move == 'scissors'
      puts "#{human.name} wins!" if computer.move == 'paper'
      puts "#{computer.name} wins." if computer.move == 'rock'
    end
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors #{human.name}!"
    divider
  end

  def display_goodbye_message
    divider
    puts "Thanks for playing! Goodbye."
  end

  def divider
    puts "#{'-' * 30}"
  end
end

RPSgame.new.play




# Compare this design with the one in the previous assignment:

# is this design, with Human and Computer sub-classes, better? Why, or why not?
# what is the primary improvement of this new design?
# what is the primary drawback of this new design?

# Answer - I think this new design is better, because it puts the logic for the particular player
# into a subclass where we know we're only talking about that type of player. Before, we were essentially
# creating 2 paths within Player, and now we have two distinct wrappers for each path that have their
# self contained logic and can easily be read/modified. Another benefit, is it makes it that much easier
# to generate new computer instances if you wanted to expand the game.

# The primary drawback of this design... in my opinion, is that it just adds a bit to the vertical complexity.
# Before, all logic was one in one player method, and so you could focus there. With the player class being inherited
# you now have to consider how changes to that, will impact changes lower in the hierarchy, and be more strategic about this
# down the road in case you break something.