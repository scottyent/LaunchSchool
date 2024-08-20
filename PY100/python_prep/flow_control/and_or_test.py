print(1 or 2 and 3) # 1
print(0 or 2 and 3) # 3
print(1 or 0 and 3) # 1
print(1 or 2 and 0) # 1
print(0 or 0 and 3) # 0
print(0 or 2 and 0) # 0 (from the and?)
print(1 or 0 and 0) # 1
print(0 or 0 and 0) # 0

print(1 and 2 or 3) # 2
print(0 and 2 or 3) # 3
print(1 and 0 or 3) # 3
print(1 and 2 or 0) # 2
print(0 and 0 or 3) # 3
print(0 and 2 or 0) # 0
print(1 and 0 or 0) # 0
print(0 and 0 or 0) # 0