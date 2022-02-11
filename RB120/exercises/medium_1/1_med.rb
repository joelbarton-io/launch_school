class Machine
  def start
    self.flip_switch(:on)
  end

  def stop
    self.flip_switch(:off)
  end

  def display_switch
    puts switch
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

curr = Machine.new

curr.start
curr.display_switch
curr.stop
curr.display_switch

# prepend 'self' to your setter methods!