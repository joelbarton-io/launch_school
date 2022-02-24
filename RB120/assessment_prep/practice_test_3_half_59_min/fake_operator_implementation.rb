class House
  attr_reader :price
  def initialize(price)
    @price = price
  end

  def ==(other)
    price == other.price
  end
end

my_house   = House.new(10)
your_house = House.new(11)
=begin
How and why would we implement a fake operator in a custom class? Give an example.

How? -> by defining a custom equality method that utilizes a part of the core library
(e.g. `Integer#==`)
We would likely want to define a custom `==` instance method for our class if we end up
needing to check to see if two objects have some similar values stored in their instance
variables.  Instead of directly comparing to objects (e.g. two House objects), we probably
would like to compare square footage or their respective prices.  By defining a fake operator
like `==` within our House class, we can easily implement these various behaviors while
preserving the readability and comprehensibility of our code.

Let's say we want to compare the prices of two house objects.  It is very easy to digest
seeing `my_house == your_house`.

In the above example, we define a custom `House#==` method that compares two House object's
`price`s. The `==` on line 8 is the `Integer#==` since the two values being compared are
themselves integers.
=end
