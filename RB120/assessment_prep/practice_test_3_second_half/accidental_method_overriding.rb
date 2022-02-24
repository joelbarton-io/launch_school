class Email
  def send(address)
    # ... sends some mail
  end
end
=begin
When does accidental method overriding occur, and why? Give an example.

Accidental method overriding occurs when a method defined in some super class
is overridden by a method in some subclass to that super class. It occurs when
we have two methods that share the same name and that method is invoked.

Lets say we have an `Email` class like the one above and try to call `Object#send` on
an instance of `Email`. We pass `send` and symbol argument representing some method
name. And instead invoke `Email#send` instead. This occurs because of how Ruby's
method lookup path works.  Since the instance we called `send` on is an instance
of the `Email` class, thats where it begins its search to resolve the method lookup.
It finds `Email#send` which it executes.
=end
