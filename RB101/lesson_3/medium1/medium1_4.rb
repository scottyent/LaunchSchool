def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

=begin
She wrote two implementations saying,
"Take your pick. Do you like << or + for modifying the buffer?".
Is there a difference between the two, other than what operator
she chose to use to add an element to the buffer?

Yes there is a difference in that the + doesn't mutate, so it's constantly
re-assigning the variable buffer.
Using << means you're mutating in place and using the same location in memory,
and that changes the buffer outside of the method as well.

The benefit is that "buffer" in the outer scope will automatically change
because it's been transformed. Whereas with option 2, you'd have to assign
buffer to the outcome of the method which is a bit more confusing.
=end