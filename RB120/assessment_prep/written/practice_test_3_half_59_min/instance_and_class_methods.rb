=begin
What is the difference between instance methods and class methods?

Instance methods are behaviors defined for instances of a class and are only invocable upon objects of
the class wherein they were defined or some instance of a subclass to the class they were defined.
They are defined within a class definition but relate to instances of that class.

Similarly, class methods are defined within a class definition.  The main difference is that
class methods are defined directly on the class itself; meaning that we invoke class methods
on the class. Class methods implement behavior specific to the class (or some subclass) and
aren't available to instances of the class wherein they were defined.

Instance methods are scoped at the object level.  They contain information about an object's
state and are only accessible within the context of the object itself.  This means that the only
way to access and modify the value referenced by some instance variable is via an instance method
that object has access to. To access, we would use a getter for that instance, to modify, we would
reach for a setter method.
=end
