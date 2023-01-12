# Update your solution to accept a low and high value when you create a
# GuessingGame object, and use those values to compute a secret number for
# the game. You should also change the number of guesses allowed so the user
# can always win if she uses a good strategy. You can compute the number of
# guesses with:

# Math.log2(size_of_range).to_i + 1

# Todo
# - Implement a custom range by accepting two parameters for initialization :DONE
# - Implement the formula for enough guess options

require 'pry'
require 'pry-byebug'

class GuessingGame

  attr_accessor :range

  def initialize(range_begin, range_end)
    @range = (range_begin..range_end)
    @guesses = enough_guesses
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

  def enough_guesses
    Math.log2(range.size).to_i + 1
  end

  def new_number
    range.to_a.sample
  end

  def reset
    self.guesses = enough_guesses
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
      puts "Enter a valid number between #{range.first} and #{range.last}:"
      self.guess = gets.chomp
      self.guess = guess.to_i if valid_integer?(guess)
      break if (guess.is_a? Integer) && range.cover?(guess)
      puts "Invalid guess."
    end

    self.guesses -= 1
  end

  def valid_integer?(input)
    input.to_i.to_s == input
  end
end


# # Tests
game = GuessingGame.new(501, 1500)
game.play

# You have 10 guesses remaining.
# Enter a number between 501 and 1500: 104
# Invalid guess. Enter a number between 501 and 1500: 1000
# Your guess is too low.

# You have 9 guesses remaining.
# Enter a number between 501 and 1500: 1250
# Your guess is too low.

# You have 8 guesses remaining.
# Enter a number between 501 and 1500: 1375
# Your guess is too high.

# You have 7 guesses remaining.
# Enter a number between 501 and 1500: 80
# Invalid guess. Enter a number between 501 and 1500: 1312
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 501 and 1500: 1343
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 501 and 1500: 1359
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 501 and 1500: 1351
# Your guess is too high.

# You have 3 guesses remaining.
# Enter a number between 501 and 1500: 1355
# That's the number!

# You won!

# game.play
# You have 10 guesses remaining.
# Enter a number between 501 and 1500: 1000
# Your guess is too high.

# You have 9 guesses remaining.
# Enter a number between 501 and 1500: 750
# Your guess is too low.

# You have 8 guesses remaining.
# Enter a number between 501 and 1500: 875
# Your guess is too high.

# You have 7 guesses remaining.
# Enter a number between 501 and 1500: 812
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 501 and 1500: 843
# Your guess is too high.

# You have 5 guesses remaining.
# Enter a number between 501 and 1500: 820
# Your guess is too low.

# You have 4 guesses remaining.
# Enter a number between 501 and 1500: 830
# Your guess is too low.

# You have 3 guesses remaining.
# Enter a number between 501 and 1500: 835
# Your guess is too low.

# You have 2 guesses remaining.
# Enter a number between 501 and 1500: 836
# Your guess is too low.

# You have 1 guess remaining.
# Enter a number between 501 and 1500: 837
# Your guess is too low.

# You have no more guesses. You lost!