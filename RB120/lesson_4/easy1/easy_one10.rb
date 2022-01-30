class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

bag = Bag.new('red', 'suede')

puts bag

=begin

when instantiated an instance of a class, you must provide the appropriate
number of arguments


`Class::new` 
=end
