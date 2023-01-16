#13 — What will be returned by the value1 and value2 method calls?

VAL = 'Global'

module Foo
  VAL = 'Local'

  class Bar
    def value1
      VAL
    end
  end
end

class Foo::Bar
  def value2
    VAL
  end
end

p Foo::Bar.new.value1
p Foo::Bar.new.value2

# It was local.
# then Global?

# I'm not entirely sure why this would trigger differet areas.
# Ah this is similar to that question in the forums, so basically Foo::Bar is
# overwriting the method that was written inside the Foo module.