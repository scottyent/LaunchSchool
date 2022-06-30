VALID_CHOICES = %w(rock paper scissors spock lizard)
ABBREV_CHOICES = %w(r p sc sp l)

def prompt(message)
  puts "=> #{message}"
end

def abbreviation_to_word(abbreviation)
  VALID_CHOICES.each do |word|
    if word.start_with?(abbreviation)
      return word
    end
  end
end

def display_line_break()
  puts "----------------"
end

def win?(first, second)
  (first == 'rock' && %w(scissors lizard).include?(second)) ||
    (first == 'paper' && %w(rock spock).include?(second)) ||
    (first == 'scissors' && %w(paper lizard).include?(second)) ||
    (first == 'spock' && %w(scissors rock).include?(second)) ||
    (first == 'lizard' && %w(spock paper).include?(second))
end

def display_games_won(human_score, computer_score)
  prompt("Games won: Player = #{human_score}, Computer = #{computer_score}")
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

wins = {
  computer: 0,
  player: 0
}

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets().chomp()

    break if VALID_CHOICES.include?(choice.downcase) || ABBREV_CHOICES.include?(choice.downcase)
    if choice.downcase == 's'
      prompt("Both Scissors and Spock start with S.")
    else
      prompt("That's not a valid answer.")
    end
  end

  choice = abbreviation_to_word(choice)
  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}, computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  # Logic to increment the score, but inside the body due to issues with scope inside methods
  if win?(choice, computer_choice)
    wins[:player] += 1
  elsif win?(computer_choice, choice)
    wins[:computer] += 1
  end

  display_games_won(wins[:player], wins[:computer])
  break if wins[:computer] == 3 || wins[:player] == 3

  prompt("Do you want to play again? (y/n)")
  play_again = gets().chomp()
  break unless play_again.downcase.start_with?('y')
end
prompt("Final result")
display_line_break()
display_games_won(wins[:player], wins[:computer])
display_line_break()
prompt("Thanks for playing, goodbye!")
