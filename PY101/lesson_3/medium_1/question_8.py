# Function and method calls can take expressions as arguments. Suppose we
# define a function named rps as follows, which follows the classic rules
# of the rock-paper-scissors game, but with a slight twist: in the event of
# a tie, it just returns the choice made by both players.

def rps(fist1, fist2):
    if fist1 == "rock":
        return "paper" if fist2 == "paper" else "rock"
    elif fist1 == "paper":
        return "scissors" if fist2 == "scissors" else "paper"
    else:
        return "rock" if fist2 == "rock" else "scissors"

# What does the following code output?

print(rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock"))
