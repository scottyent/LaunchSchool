# Let's do some "ASCII Art": a stone-age form of nerd artwork from back in the
# days before computers had video screens.

# For this practice problem, write a program that outputs The Flintstones Rock!
# 10 times, with each line prefixed by one more hyphen than the line above it.
# The output should start out like this:

# -The Flintstones Rock!
# --The Flintstones Rock!
# ---The Flintstones Rock!
#     ...

for pad in range(1,11):
    print(f'{pad * '-'}The Flintstones Rock!')