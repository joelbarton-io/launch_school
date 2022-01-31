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

=begin
case 1 -> "Hello" printed. method lookup1 [Hello] , method lookup2 [Hello, Greeting]
case 2 -> NameError -> undefined method. method lookup [Hello, Greeting, Object, Kernel, BasicObject]
case 3 -> ArgumentError. Wrong number of arguments, expected 1, got 0
case 4 -> "Goodbye" ml -> [Hello, Greeting]
case 5 -> NoMethodError, undefined method `hi` for Class Hello
=end