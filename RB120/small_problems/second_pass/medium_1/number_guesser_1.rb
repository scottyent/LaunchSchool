# Create an object-oriented number guessing class for numbers in the range 1
# to 100, with a limit of 7 guesses per game. The game should play like this:
require 'pry'
require 'pry-byebug'

class GuessingGame
  RANGE_BEGIN = 1
  RANGE_END = 100

  def initialize
    @guesses = 7
    @number = new_number
    @guess = nil
  end

  def play
    while guesses > 0
      display_guesses
      get_number
      outcome = check_guess
      display_outcome(outcome)
      break if correct_guess?(guess)
    end

    puts "You lose. The number was #{number}" unless correct_guess?(guess)
    puts
    reset
  end

  private

  attr_accessor :guesses, :guess, :number

  def new_number
    (RANGE_BEGIN..RANGE_END).to_a.sample
  end

  def reset
    self.guesses = 7
    self.number = new_number
    self.guess = nil
  end

  def correct_guess?(num)
    num == number
  end

  def check_guess
    if guess < number
      'low'
    elsif guess > number
      'high'
    else
      'match'
    end
  end

  def display_outcome(evaluation)
    if evaluation == "match"
      puts "That's the number!"
      puts
      puts "You won!"
    else
      puts "Your guess is too #{evaluation}"
    end
  end
  def display_guesses
    puts "You have #{guesses} remaining."
  end

  def get_number
    loop do
      puts "Enter a valid number between #{RANGE_BEGIN} and #{RANGE_END}:"
      self.guess = gets.chomp
      self.guess = guess.to_i if valid_integer?(guess)
      break if (guess.is_a? Integer) && (RANGE_BEGIN..RANGE_END).cover?(guess)
      puts "Invalid guess."
    end

    self.guesses -= 1
  end

  def valid_integer?(input)
    input.to_i.to_s == input
  end
end

game = GuessingGame.new
game.play

game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# That's the number!

# You won!

# game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 50
# Your guess is too high.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 25
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 37
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 31
# Your guess is too low.

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 34
# Your guess is too high.

# You have 2 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have 1 guess remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have no more guesses. You lost!