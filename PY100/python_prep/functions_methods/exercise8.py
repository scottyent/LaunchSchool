# Without running the following code, what do you think it will do?

def foo(bar, qux):
    print(bar)
    print(qux)

foo(42, 3.141592, 2.718)

# Again, argument error because we're giving 3 positional arguments when the function
# definition only defines 2.
