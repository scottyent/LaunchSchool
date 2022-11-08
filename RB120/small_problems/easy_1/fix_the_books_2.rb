# Complete this program so that it produces the expected output:

class Book
  attr_accessor :author, :title

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

# # Expected output;
# The author of "Snow Crash" is Neil Stephenson.
# book = "Snow Crash", by Neil Stephenson.

# Further Exploration
# What do you think of this way of creating and initializing Book objects? (The two steps are separate.)
#   Would it be better to create and initialize at the same time like in the previous exercise?
#   What potential problems, if any, are introduced by separating the steps?

# Interesting question - I would say that it's better to initialize and give the basic values during initialization. Breaking up the steps
# allows mistakes to happen, most commonly I'd think would be accidentally leaving an object blank. No initialization of instance variables.
# Requiring them for object instantiation is also good because it reminds you of what is needed for the core attributes of a class.