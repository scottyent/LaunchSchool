import random

VALID_CHOICES = ['rock', 'paper', 'scissors', 'spock', 'lizard']

BEATS = {
    'rock'    : ['scissors', 'lizard'],
    'paper'   : ['rock', 'spock'],
    'scissors': ['paper', 'lizard'],
    'spock'   : ['rock', 'scissors'],
    'lizard'  : ['paper', 'spock'],
}

def prompt(message):
    print(f'==>{message}')

def user_wins(player, computer):
    return computer in BEATS[player]

def computer_wins(player, computer):
    return player in BEATS[computer]

def display_winner(player, computer):
    if user_wins(player, computer):
        prompt('You win!')
    elif computer_wins(player, computer):
        prompt('Computer wins.')
    else:
        prompt('It\'s a tie!')

def ask_spock_or_scissors():
    prompt('You only entered one s. Did you mean Spock or Scissors?')
    answer = input().casefold()

    while not (answer.startswith('sp') or answer.startswith('sc')):
        prompt("I'm sorry, that's not a valid choice")
        answer = input().casefold()

    return answer

def match_choice(player_choice):

    # Handle empty strings
    if not player_choice:
        return player_choice

    # Handle single character s choice
    if player_choice.startswith('s') and len(player_choice) == 1:
        player_choice = ask_spock_or_scissors()

    for move in VALID_CHOICES:
        if move.startswith(player_choice):
            return move

    return "Failed to match"

prompt(f'Welcome to the {', '.join(VALID_CHOICES)} game!')

while True:
    prompt(f'Choose one: {', '.join(VALID_CHOICES)}')
    choice = match_choice(input().casefold())

    while choice not in VALID_CHOICES:
        prompt(f'Please choose from {', '.join(VALID_CHOICES)}')
        choice = match_choice(input().casefold())

    computer_choice = random.choice(VALID_CHOICES)
    prompt(f'Your pick: {choice} |  Computer pick: {computer_choice}')

    display_winner(choice, computer_choice)

    prompt('Do you want to play again? y/n')
    play_again = input().casefold()

    while True:
        if play_again.startswith('n') or play_again.startswith('y'):
            break
        prompt('Pick either "y" or "n"')
        play_again = input().casefold()

    if play_again[0] == 'n':
        break
