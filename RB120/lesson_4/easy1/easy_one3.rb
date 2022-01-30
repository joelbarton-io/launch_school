module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

=begin
when we invoke the instance method `go_fast` on the Car object, `self` refers to the
calling object, that is, self refers to the Car object.  Since this object is an
instance of the Car class, when we call `class` on this object, it's class is
revealed to be `Car`.


I forgot to mention that, since we are using string interpolation, the 'to_s' method is
automatically called, so we don't need to explicitly call it.

"we 'ask' self to tell us its class with `.class`"
=end