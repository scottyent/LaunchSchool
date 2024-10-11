# One day, Spot was playing with the Munster family's home computer, and he
# wrote a small program to mess with their demographic data:

munsters = {
    "Herman": {"age": 32, "gender": "male"},
    "Lily": {"age": 30, "gender": "female"},
    "Grandpa": {"age": 402, "gender": "male"},
    "Eddie": {"age": 10, "gender": "male"},
    "Marilyn": {"age": 23, "gender": "female"},
}

def mess_with_demographics(demo_dict):
    for key, value in demo_dict.items():
        value["age"] += 42
        value["gender"] = "other"

# After writing this function, he typed the following code:
mess_with_demographics(munsters)

# Before Grandpa could stop him, Spot hit the Enter key with his tail.
# Did the family's data get ransacked? Why or why not?

# Yes it did! Dictionaries are mutable, and the function iterates through the
# dictionary, and uses assignment to modify the values in the nested dictionary.
# It will access each nested dictionary for each family member, and use the key
# 'age' and 'gender' to update the values to the ones Spot put in.

# Printing out the dictionary will show the ages incremented by 42, and genders
# all assigned to other

print(munsters)