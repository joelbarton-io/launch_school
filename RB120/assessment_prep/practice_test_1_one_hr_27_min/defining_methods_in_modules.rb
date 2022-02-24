module Drivable
  def self.drive
    puts 'Driving'
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive

Car.drive
=begin
What is output and why? What does this demonstrate about how methods
need to be defined in modules, and why?

We get a `NoMethodError` message since we tried to call a method that wasn't defined to be
invoked on instances. If we wanted to call the method defined on lines 2-4 on an instance
we would need to define it as an instance method (removing the `self.` from the method name.)

If we try to define a class method inside a module, we will only be able to invoke that method
directly on the module itself.  We could call `self.drive` upon the `Drivable` module.

We should define `drive` as an instance method if we want to call it on an instance of
the class we are `including` `Drivable`.
=end
