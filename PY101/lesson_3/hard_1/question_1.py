# Will the following functions return the same results?

def first():
    return {
        'prop1': "hi there",
    }

def second():
    return
    {
        'prop1': "hi there",
    }

print(first())
print(second())

# I'm going to say no. Second() will likely just return None because there's no
# indication on the same line as the return that a dictionary value is following.
# whereas in first(), the open bracket is on the same line as the return, so it
# would recognize to include the full data structure that began on that line.