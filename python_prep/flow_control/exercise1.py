# To what values do the following expressions evaluate?

print(False or (True and False)) # False
print(True or (1 + 2)) # True
print((1 + 2) or True )# True -> 3
print(True and (1 + 2)) # True -> 3
print(False and (1 + 2)) # False
print((1 + 2) and True) # True
print((32 * 4) >= 129) # False
print(False != (not True)) # False
print(True == 4) # False (I wrote True, though wasn't certain about truthy to True comparison. Apparently it's false!)
print(False == (847 == '847')) # True