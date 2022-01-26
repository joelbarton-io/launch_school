module Drivable
  def self.drive
    self
  end
end

class Car
  include Drivable
end

bobs_car = Car.new

p Drivable.drive # => 'driving'
#p Car.drive      # => NoMethodError
