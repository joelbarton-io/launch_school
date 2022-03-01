module Drivable
  def self.drive
    puts 'driving'
  end
end

class Car
  include Drivable
end

Car.new.drive

# What is output and why? What does this demonstrate about how methods need to
# be defined in modules, and why?
=begin
When we run this code, we receive a NoMethodError since there is no `drive`
instance method.  The method defined on line 2 is a
=end
