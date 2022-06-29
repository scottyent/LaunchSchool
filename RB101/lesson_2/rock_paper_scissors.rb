VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!\u{1F389}")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("Tie")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets().chomp()

    break if VALID_CHOICES.include?(choice.downcase)
    prompt("That's not a valid answer.")
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}, computer chose: #{computer_choice}")

  sleep(1)
  display_results(choice, computer_choice)

  prompt("Do you want to play again? (y/n)")
  play_again = gets().chomp()
  break unless play_again.downcase.start_with?('y')
end

prompt("Thanks for playing, goodbye!")
