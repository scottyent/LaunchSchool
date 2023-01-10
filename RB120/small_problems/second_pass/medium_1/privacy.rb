# Modify this class so both flip_switch and the setter method switch= are
# private methods.

class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  def status
    p switch
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

thing = Machine.new
thing.start
thing.status
thing.stop
thing.status