# Alyssa was asked to write an implementation of a rolling buffer. You can add
# and remove elements from a rolling buffer. However, once the buffer becomes
# full, any new elements will displace the oldest elements in the buffer.

# She wrote two implementations of the code for adding elements to the buffer:

def add_to_rolling_buffer1(buffer, max_buffer_size, new_element):
    buffer.append(new_element)
    if len(buffer) > max_buffer_size:
        buffer.pop(0)
    return buffer

def add_to_rolling_buffer2(buffer, max_buffer_size, new_element):
    buffer = buffer + [new_element]
    if len(buffer) > max_buffer_size:
        buffer.pop(0)
    return buffer

# What is the key difference between these implementations?
# I would say the main difference is that append is mutating the original list
# that is being referenced by the variable buffer.

# The second option is actually creating and returning a brand new list that
# is created from list concatenation.

# This is an important distinction because the first option mutates an object
# outside of the function, whereas the second option only returns a new list
# without mutating the original. If you're not familiar with this, you might
# expect the buffer to change, or not handle storing the return value.

