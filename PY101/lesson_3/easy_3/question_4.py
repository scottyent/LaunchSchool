my_list1 = [{"first": "value1"}, {"second": "value2"}, 3, 4, 5]
my_list2 = my_list1.copy()
my_list2[0]['first'] = 42
print(my_list1)

# This will print a list with the following values:
# [{"first": 42}, {"second": "value2"}, 3, 4, 5]
# the reason for this is that the copy() method for a list produces a shallow
# copy, which is to say that it only is copying the outermost layer of the list. Since
# the first two values in the list are dictionary objects, at the outermost layer
# that is being copied, they are just pointers to the nested objects. So on line 3,
# when you reassign a value you're accessing (using that copied pointer) the same
# dictionary object that exists in my_list1, and mutating it with assigning a new value.