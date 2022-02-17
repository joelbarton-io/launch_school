require 'pry'

class House
  attr_reader :price

  include Comparable
  def initialize(price)
    @price = price
  end

  def <=>(other)
    binding.pry
    price <=> other.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2 # => Home 1 is cheaper
puts "Home 2 is more expensive" if home2 > home1 # => Home 2 is more expensive

# What module/method could we add to the above code snippet to output the
# desired output on the last 2 lines, and why?

=begin
We could `include` the Comparable module and define a custom combined
comparison instance method that lets us compare the prices of the
homes using `Comparable#<=>`. We use our custom method to initially
override `Comparable#<=>`, then call `Comparable#<=>` with our
calling object and argument's prices.
=end
