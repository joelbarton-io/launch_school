class Cat
  def initialize(type)
    @type = type
  end
end

=begin
question:
Given the class below, if we created a new instance of the class and then called
to_s on that instance we would get something like "#<Cat:0x007ff39b356d30>"

How could we go about changing the to_s output on this method to look like this:
I am a tabby cat? (this is assuming that "tabby" is the type we passed in during
initialization).


answer:
If we wanted to accomplish this task, we would simply define a custom instance
method `to_s` where we could implement the desired output (I am a #{@type} cat).

This custom instance method would override the default (EXISTING) `to_s`. Since we
call `to_s` upon an instance of the class Cat, it is within the Cat class definition
that ruby starts looking for an instance method named `to_s`.  Once it is found,
the search is resolved and ruby uses the found method's functionality.


didn't say:

while this would work, it would be better to write a new method that more closely
relates to the desired output, something called say `display_type`. 