# Given:
class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# What would happen if I called the methods like shown below?
tv = Television.new
tv.manufacturer # => Will cause a NoMethodError because you're calling a class
# method on an instance
tv.model

Television.manufacturer
Television.model # => will cause a NoMethodError because you're calling an
# instance method on a class



