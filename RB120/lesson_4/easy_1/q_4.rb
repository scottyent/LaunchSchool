# If we have a class AngryCat how do we create a new instance of this class?

#   The AngryCat class might look something like this:

class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

# You create a new instance by creating a variable for it, and calling the class
# name + .new

salem = AngryCat.new

salem.hiss

# Stricly speaking not entirely correct. The creating of a variable part I
# included isn't necessary for the definition of creating an instance.
# Technically, just by doing AngryCat.new, that's creates the instance and
# you don't HAVE to store it somewhere, you could also do this:

AngryCat.new.hiss