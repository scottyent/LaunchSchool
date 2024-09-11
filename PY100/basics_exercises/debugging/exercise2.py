# Our predict_weather function should output a message indicating whether
# a sunny or cloudy day lies ahead. However, the output is the same every
# time the function is invoked. Why? Fix the code so that it behaves as expected.

import random

def predict_weather():
    sunshine = random.choice([True, False])

    if sunshine:
        print("Today's weather will be sunny!")
    else:
        print("Today's weather will be cloudy!")

predict_weather()

# It's not working because the random choice from the collection is returning
# a string literal, and not a boolean. Therefore, any string is seen as a Truthy
# value, so it always executes the if part of the if statement. By changing
# the values to choose from to actual boolean values, you fix the code.