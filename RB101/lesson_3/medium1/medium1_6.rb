answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

=begin
The answer should be 34 because the method doesn't do anything (doesn't mutate the caller)
to the original, so it's only saving the new value into new_answer which isn't factored into
the outpout on the last line

Result = 34
=end