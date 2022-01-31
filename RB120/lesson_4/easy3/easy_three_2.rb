class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# If we call Hello.hi we get an error message. How would you fix this?

=begin
by defining a class method -> def self.hi; end

calling an instance method defined in a different class within a class
method defined in a different class.  Instance method is only defined to be
invoked on instances of a class, so we must invoke it upon an instance, it
cannot be invoked otherwise.
=end