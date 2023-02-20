# Implementing an Enumerable#one? method
# The trick here is that it will return false if a SECOND true is returned
# from the block

# Algorithm - similar to any, except what do I do to keep track of this

# so it's running through it and it finds a true, great. It has to record that somewhere
# then it's continueing through, and finds a second true, it has to recognize it's the
# second one, and return false. Otherwise continue on and return true.

def one?(collection)
  return false if collection.empty?

  found = []

  collection.each do |item|
    outcome = yield(item)

    if outcome
      if found.empty?
        found << outcome
      else
        return false
      end
    end
  end

  !found.empty?
end


# Test Cases
p one?([1, 3, 5, 7]) { |value| value.odd? } ==    false
p one?([2, 4, 6, 8]) { |value| value.even? } ==   false
p one?([1, 3, 5, 6]) { |value| value.even? } ==   true
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p one?([1, 3, 5, 7]) { |value| true } ==          false
p one?([1, 3, 5, 7]) { |value| false } ==         false
p one?([]) { |value| true } ==                    false