#17 — What does each self refer to in the code snippet below?

class MeMyselfAndI
  self

  def self.me
    self
  end

  def myself
    self
  end
end

i = MeMyselfAndI.new

# First self -> class
# Second self -> class
# thitrd self -> object itself