# Which one of these is a class method (if any) and
# how do you know? How would you call a class method?

# self.manufacturer is a class method because you call self on it within the
# class definition. Self in this context refers to the class itself, rather
# than an instance.

# To call a class method you type the class name.class_method. In this example
# it would Television.manufacturer

  class Television
    def self.manufacturer
      # method logic
    end

    def model
      # method logic
    end
  end