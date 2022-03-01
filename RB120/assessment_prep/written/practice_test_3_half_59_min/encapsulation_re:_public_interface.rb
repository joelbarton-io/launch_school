=begin
How does encapsulation relate to the public interface of a class?

The public interface of a class is comprised of the those methods which are
available to object of that class (or objects of some subclass to that class)
from outside the class.  These methods are available to users of the class.

Classes are said to encapsulate behaviors (e.g. methods) since to access
the functionality of some method defined in some class, we either need to
know the name of the class or have access to some instance of that class.

Via method access control, we can further encapsulate the behaviors defined in our
custom class by designating certain methods as being `private` or `protected` and
thus no longer part of that class' public interface.

By doing this, we ensure that only other methods defined within our class
can expose the functionality of these `private` or `protected` methods.
=end
