# Input: the constructor takes a month (1-12) and a year
# the method `day` takes the weekday, and the schedule
# monday, tuesday, wednesday, etc.
# and schedule is first, second, third, fourth, fifth, last, or teenth.
# Output: day method should return a date object that matches the required
# parameters

# Rules
# Explicit:
# * mentioned above in inputs
# * there is only one possible teenth date that matches the given day of the week
# per month

# Implicit:
# * the day and the schedule are both case insensitive, so need to be controlled
# for by downcasing the input
# * date object needs to be returned by day method
# * day is an instance method, month and year are in the constructor

# Algorithm:
# * Ok after reading up on the Date module, I would say that what we want to do
# is initialize a date starting on the first day of the month and year we're
# given. Then we're going to iterate through, and use the deconstruct keys
# method which allows us to pattern match against wday

# Alright so save the month in a variable, iterate until the month value of the
# date no longer is the same month. Each iteration, use the next command if
# the pattern isn't matched appropriately.

# I'm going to do this the simple way first, which is brute force iterating
# through each day and checking it. I think there's a better way to do this
# to make it start in a more relevant place, but I'm going to get my core
# logic first right before iterating.

# then how do I trigger the matches - I think I'll use a hash for the days of
# the week, that convert them to their appropriate digit represented in wday

# I can have a variable that is something like day_amount, and set it to 0.
# Increment that each time there is a match, and stop once it aligns with
# second, first, third, etc. Although, teenth... teenth is anything that matches
# days 13-19. This is an easy match but a different match then above, so perhaps
# I should think about how I"m going to handle that, either in the same loop
# or send the logic in a different branch for teenth