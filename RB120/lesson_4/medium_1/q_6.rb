# Given these methods:

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

# and

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    self.template
  end
end

# What is the difference in the way the code works?
# Well, nothing. In terms of how it behaves, it's the same.
# However, perhaps what they mean is that in the second method,
# the way it works is that the object instance is what populates self
# and so it becomes Object_name.template, which effectively accesses the
# getter method. In the first, template immediately just calls the getter
# directly

# Correct - they were just pointing out getters don't need the self

