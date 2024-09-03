# Determine what the following code snippet prints. First solve it in your
# head or on paper, then run it in your Python environment to check the result.

speed = 0
acceleration = 24
braking_force = 19
is_moving = braking_force < acceleration and (speed > 0 or acceleration > 0)
print(is_moving)

# This will print True. We first look at the parantheses on the right side of
# the logical and statement, and see a logical or evaluation. On the left,
# speed > 0 evaluates to false. However, on the right, acceleration > 0 is True.
# Since OR only requires one argument to be true, it'll evaluate to True.
# Then, looking at the left, a simple comparison evaluates to True since the
# braking force is less than the acceleration. This leads to True being on
# both sides of the AND operator, evaluating to True.

# Bonus question: Do we need the parentheses in the boolean expression or
# could we have written the following?:

is_moving = braking_force < acceleration and speed > 0 or acceleration > 0


# We could not write it like above (we do need the parentheses) because AND
# has a higher operator precedence than OR. comparisons are also higher than AND
# so we would start with braking_force < acceleration, which evaluates to True.
# Speed > 0 evaluates to False, and acceleration > 0 evaluates to true. so we have

is_moving = True and False or True

# From here, AND has precedence, so that evaluates to False, and False or True
# eveluates to True. Your answer is the same, but the logic of how you got
# there absolutely is not, and so I think you need to keep parentheses to keep
# the actual logic of the formula.
