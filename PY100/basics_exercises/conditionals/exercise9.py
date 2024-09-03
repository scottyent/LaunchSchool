# Without running the following code, determine what will be printed.

sale = True
admission_price = 5.25 if not sale else 3.99

print(f"${admission_price}")

# It'll print 3.99. This is ternary assignment, and since not sale will evaluate
# to false, it'll execute the else side and assign admission_price the value
# of 3.99