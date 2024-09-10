# We have a grocery list. As we check off items on that list, we want to remove
# them from the list.

# Write code that removes the items from grocery_list, one by one, until it is
# empty. If you print the elements you remove, the expected behavior would
# look as follows.

def remove_grocery(item, shopping_list):
    if item in shopping_list:
        shopping_list.remove(item)
        print(item)
    else:
        print(shopping_list)


grocery_list = ['paprika', 'tofu', 'garlic', 'quinoa',
                'carrots', 'broccoli', 'hummus']

for item in grocery_list.copy():
    remove_grocery(item, grocery_list)

print(grocery_list)

# Expected Output:
# paprika
# tofu
# garlic
# quinoa
# carrots
# broccoli
# hummus
# []