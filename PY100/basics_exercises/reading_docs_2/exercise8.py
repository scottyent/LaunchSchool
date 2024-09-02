# The following code raises a SyntaxError:

speed_limit = 60
current_speed = 80

if current_speed > speed_limit:
    print('"People are so bad at driving cars that '
          "computers don\'t have to be that good to be "
          'much better." -- Marc Andreessen')

# What does a SyntaxError indicate? Try running the above code, then use the
# resulting error message to fix the error.

# A SyntaxError is basically telling you there is something wrong with how you
# explicitly typed out the commmands. So there is a parantheses missing, or
# the structure of the loop you built is missing a piece, so the computer
# doesn't know what to do.

# In the above, without running it, it's because there isn't a colon to start the
# if block.