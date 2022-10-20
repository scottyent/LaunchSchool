=begin
A friend of yours wrote a number guessing game.
The first version he shows you picks a random number
between 1 and a provided maximum number and offers
you a given number of attempts to guess it.

However, when you try it, you notice that it's not
working as expected. Run the code and observe its behavior.
Can you figure out what is wrong?

Multiple things are wrong - when you guess the right number,
it doesn't kick you out and complete.
It also doesn't track attempts correctly and lets you guess
forever.

To fix these things:
1. Take off the method call that's inside the overall method.
Calling it again with the max_attempts is resetting the attempts every time
just call
2. Put in a break after you guess correctly to break out of the loop
=end

require 'pry'

def valid_integer?(string)
  string.to_i.to_s == string
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  attempts = 0

  loop do
    attempts += 1
    break if attempts > max_attempts

    input = nil
    until valid_integer?(input)
      print 'Make a guess: '
      input = gets.chomp
    end

    guess = input.to_i

    if guess == winning_number
      puts 'Yes! You win.'
      break
    else
      puts 'Nope. Too small.' if guess < winning_number
      puts 'Nope. Too big.'   if guess > winning_number
    end
  end
end

guess_number(10, 3)