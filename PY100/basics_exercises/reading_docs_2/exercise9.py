# The following code raises a TypeError:

tweet = 'Woohoo! :-)'

if len(tweet) > 140:
    print('Tweet is too long!')

length_of_tweet = len(tweet + 5)

# What does a TypeError indicate? Try running the above code, then use the
# resulting error message to determine exactly what is wrong.
# (You don't have to fix this code.)

# In the documents - TypeError is Raised when an operation or function is applied
# to an object of inappropriate type. The associated value is a string
# giving details about the type mismatch.

# The above is raising a TypeError, because you're trying to add a
# string to an integer which isn't possible.

