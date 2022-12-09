# You started writing a very basic class for handling files. However, when you
# begin to write some simple test code, you get a NameError. The error message
#   complains of an uninitialized constant File::FORMAT.

#   What is the problem and what are possible ways to fix it?

# A few ways - one I guess would be to initialize a nil FORMAT in the File
# class so that it's there to reference, but will be overwritten by the class
# values inherited.

# Another way is to make format a specific attribute within the inherited
# classes, and make the to_s class refernece a local instance variable
# that you individually define per class

# Both of those worked, but I'm changing it to the much more elegant solution
# of using self.class::FORMAT because that only changes one thing, and the
# second solution above is very repetitive (With the initialization methods)

  class File
    attr_accessor :name, :byte_content

    def initialize(name)
      @name = name
    end

    alias_method :read,  :byte_content
    alias_method :write, :byte_content=

    def copy(target_file_name)
      target_file = self.class.new(target_file_name)
      target_file.write(read)

      target_file
    end

    def to_s
      "#{name}.#{self.class::FORMAT}"
    end
  end

  class MarkdownFile < File
    FORMAT = :md
  end

  class VectorGraphicsFile < File
    FORMAT = :svg
  end

  class MP3File < File
    FORMAT = :mp3
  end

  # Test

  blog_post = MarkdownFile.new('Adventures_in_OOP_Land')
  blog_post.write('Content will be added soon!'.bytes)

  copy_of_blog_post = blog_post.copy('Same_Adventures_in_OOP_Land')

  puts copy_of_blog_post.is_a? MarkdownFile     # true
  puts copy_of_blog_post.read == blog_post.read # true

  puts blog_post