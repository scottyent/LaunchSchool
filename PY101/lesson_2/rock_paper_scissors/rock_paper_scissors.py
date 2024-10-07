import random

VALID_CHOICES = ['rock', 'paper', 'scissors', 'spock', 'lizard']
TOTAL_GAMES = 5
GAMES_NEEDED_TO_WIN = (TOTAL_GAMES//2 + 1)

BEATS = {
    'rock'    : ['scissors', 'lizard'],
    'paper'   : ['rock', 'spock'],
    'scissors': ['paper', 'lizard'],
    'spock'   : ['rock', 'scissors'],
    'lizard'  : ['paper', 'spock'],
}

def prompt(message):
    print(f'==> {message}')

def display_separator():
    print('---------------')

def user_wins(player, computer):
    return computer in BEATS[player]

def computer_wins(player, computer):
    return player in BEATS[computer]

def update_scoreboard(player, computer, current_scoreboard):
    if user_wins(player, computer):
        current_scoreboard['Player'] += 1
    elif computer_wins(player, computer):
        current_scoreboard['Computer'] += 1

def display_scoreboard(current_scoreboard):
    prompt('Scoreboard')
    display_separator()
    for player, score in current_scoreboard.items():
        prompt(f'{player}: {score}')
    display_separator()

def display_winner(player, computer):
    if user_wins(player, computer):
        prompt('You win!')
    elif computer_wins(player, computer):
        prompt('Computer wins.')
    else:
        prompt('It\'s a tie!')

def display_champion(current_scoreboard):
    display_separator()
    prompt('Game over!')
    display_scoreboard(current_scoreboard)

    for player, score in current_scoreboard.items():
        if score == GAMES_NEEDED_TO_WIN:
            prompt(f'{player} won {GAMES_NEEDED_TO_WIN} games '
                   'and is the champion! \U0001F389')

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
    if player_choice == 's':
        player_choice = ask_spock_or_scissors()

    for move in VALID_CHOICES:
        if move.startswith(player_choice):
            return move

    return None

def welcome_to_game():
    display_separator()
    prompt(f'Welcome to the {', '.join(VALID_CHOICES)} game!')
    prompt(f'If you choose to continue playing, the first to {GAMES_NEEDED_TO_WIN}'
        ' games wins the championship.')
    prompt('Good luck!')
    display_separator()

welcome_to_game()

scoreboard = {
    'Player'  : 0,
    'Computer': 0,
}

while True:
    prompt(f'Choose one: {', '.join(VALID_CHOICES)}')
    choice = match_choice(input().casefold())

    while choice not in VALID_CHOICES:
        prompt(f'Please choose from {', '.join(VALID_CHOICES)}')
        choice = match_choice(input().casefold())

    computer_choice = random.choice(VALID_CHOICES)
    prompt(f'Your pick: {choice} |  Computer pick: {computer_choice}')

    display_winner(choice, computer_choice)
    update_scoreboard(choice, computer_choice, scoreboard)

    if GAMES_NEEDED_TO_WIN in scoreboard.values():
        break

    display_scoreboard(scoreboard)

    prompt('Do you want to play again? y/n')
    play_again = input().casefold()

    while True:
        if play_again.startswith('n') or play_again.startswith('y'):
            break
        prompt('Pick either "y" or "n"')
        play_again = input().casefold()

    if play_again[0] == 'n':
        break

display_champion(scoreboard)
