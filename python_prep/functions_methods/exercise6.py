# What does the following code print?

def scream(words):
    words = words + '!!!!'
    return
    print(words)

scream('Yipeee')

# This will print nothing because once return is hit, it will stop executing the rest of the function
# and return back to the main flow
