# Complete this program so that it produces the expected output:

class Book
  attr_reader :title, :author

  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)


# Expected output
# The author of "Snow Crash" is Neil Stephenson.
# book = "Snow Crash", by Neil Stephenson.

# Further exploration;
# What are the differences between attr_reader, attr_writer, and attr_accessor? Why did we use attr_reader
# instead of one of the other two? Would it be okay to use one of the others? Why or why not?

# Answer - it's all about what you want to be accessible. We could have used attr_accessor, but that would
# also allow peoople using the class to set those variables from the outside. We may not want that.
# attr_writer would not have worked here as it would only give access to set from the outside, not get which is what we need.

# Instead of attr_reader, suppose you had added the following methods to this class:

# def title
#   @title
# end

# def author
#   @author
# end

# Would this change the behavior of the class in any way? If so, how? If not, why not? Can you think of any advantages of this code?
# Answer - this wouldn't change the behavior of the class as these are both manually created getter methods. Same functionality.
# in terms of advantages, I would say the advantage is that we can customize so if we had a format of the string (e.g. book = book.title), and
# we want to keep it consistent, we could make the formatting happen within the getter itself.