# he Python documentation for the datetime module provides two attributes to
# retrieve the year from a date or datetime object: year and isocalendar.

from datetime import date

today = date.today()

today_year = today.year
iso_year = today.isocalendar()[0]

# What is the difference between the year attribute and the isocalendar method?

# The year from today.year is simply returning the year from a datetime object.
# The iso_year variable is accessing the year variable from the tuple returned
# by isocalendar, and the date is using an alternative to the traditional
# gregorian calendar (the iso calendar).