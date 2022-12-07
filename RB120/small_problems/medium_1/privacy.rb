# Consider the following class:
class Machine
  def start
    self.flip_switch(:on)
  end

  def stop
    self.flip_switch(:off)
  end

  def status
    puts "#{switch}"
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

timmy = Machine.new

timmy.start
timmy.status

# Modify this class so both flip_switch and the setter
# method switch= are private methods.

