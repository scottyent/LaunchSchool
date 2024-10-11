# What will the following two lines of code output?

print(0.3 + 0.6) # It will approximately 0.9
print(0.3 + 0.6 == 0.9) # False

# The reason this happens is that with floating point arithemetic, we don't get
# exactly accurate answers. We get ever closer approximations of the exact answers
# but even if it's a trillionth of a decimal different, it will not evaluate to true
# when you're comparing equality.