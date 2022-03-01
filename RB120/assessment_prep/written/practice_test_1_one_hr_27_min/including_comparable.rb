class House
  include Comparable
  attr_reader :price

  def initialize(price)
    @price = price
  end

  def <=>(other)
    price <=> other.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2 # => Home 1 is cheaper
puts "Home 2 is more expensive" if home2 > home1 # => Home 2 is more expensive

=begin
What module/method could we add to the above code snippet to output the desired
output on the last 2 lines, and why?

We could include `Comparable` and define a some custom implementations for `<` and `>`
that trigger the desired string value being printed based on the calling object and
argument object's respective prices.

Based on the comments, it's clear we want to compare prices and intend on using some
custom methods to improve readability.

This would allow us to achieve the funcationality we are looking for while also
making the code easy to understand at a glance without getting too bogged down in
the implementation details for `<` and `>`.
=end