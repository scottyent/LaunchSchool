# Consider these two simple functions:
def foo(param="no"):
    return "yes"

def bar(param="no"):
    return (param == "no") and (foo() or "no")

# What will the following function invocation return?
print(bar(foo()))

# it will return false. foo returns "yes" every time it's called, so "yes" gets
# passed into bar().
# within bar, the first expression (param == "no") evaluates to False, since
# the "yes" was passed into the function and param was assigned the value of
# "yes". Since it's and AND expression, it will short circuit right there at
# the first false, and return false.