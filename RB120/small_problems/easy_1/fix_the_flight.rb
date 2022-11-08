class Flight

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

# There is nothing technically incorrect about this class, but the definition may lead to
# problems in the future. How can this class be fixed to be resistant to future problems?

# I removed the "attr_accessor :database_handle" line - apparently that's the answer because whatever that reference is
# that we're calling database_handle, it is not someting we want people to access directly. It's an implementation detail
# and something that might be used in the methods themselves, but if we change it later, and someone as used
# database_handle outside the class, then it will immediately break their code.

# Instead, without an accessor, or by making it in private, we can make sure that any big changes to the code
# can be circumvented by just updating the methods within the class. For example, if one method was something like flight_location
# and it worked by looking up the reference number in the database, we could simply change the flight_location method to look it up
# in a dictionary, or array, or whatever data structure we use. The oustide user would have no idea - they still just call flight_location
# and get the right answer.

# On the other hand, maybe they understood that the database handle is a reference inside a larger database (???) and called something like
# database_search(flight232.database_handle) - this would now completely break because we got away from using a database in the class itself.


# Or something :D