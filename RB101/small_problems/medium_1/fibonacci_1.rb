# Input: a single number representing the amount of numbers in the fibonacci sequence
# Output: the result of the number at that place in the sequence

# Rules
# Create this using a recursion strategy
# It has to call itself at least once
# Use the return value it creates.
# The formula is f(n) = F(n-1) + F(n-2) where n > 2


# Algo
# alright, use the fib formula they gave, and using the breaking the recursion statement of if n < 3 return 1
# moving this to a flowchart to show the splits
# flowchart here: https://app.diagrams.net/#G1XCekS6scgwFQ8mSA1Gqmk8OGNzDTUbpP

def fibonacci(n)
  return 1 if n < 3
  fibonacci(n - 1) + fibonacci(n - 2)
end


# Test Cases
p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765

# Pretty mind blowing - the solution gives an example of a tail recursion method that DRASTICALLY
# and I mean DRASTICALLY speeds up the method. Normally, my computer topped out around fib(45) as
# it would take a really long time to resolve. With the tail recursion, you can go up to EIGHT THOUSAND
# and have it return instantly. Absolutely shocking. We're talking 7,900 higher, and the normal way
# would take effectively forever, and the second finishes in a second. Here is the tail recursion:

def fibonacci_tail(nth, acc1, acc2)
  if nth == 1
    acc1
  elsif nth == 2
    acc2
  else
    fibonacci_tail(nth - 1, acc2, acc2 + acc1)
  end
end

def fibonacci(nth)
  fibonacci_tail(nth, 1, 1)
end

p fibonacci(8000)
