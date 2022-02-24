class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def change_info(n, h, w)
    name = n
    height = h
    weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end

sparky = GoodDog.new('Spartacus', '12 inches', '10 lbs')
sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info
# => Spartacus weighs 10 lbs and is 12 inches tall.
=begin
We expect the code above to output ”Spartacus weighs 45 lbs and is 24 inches tall.”
Why does our change_info method not work as expected?

In `GoodDog#change_info`, where we think we are reassigning the three instance variables via
their respective setter methods, we are actually initializing three new local variables.

To fix this, all we need to do is prepend `name`, `height`, and `weight` with `self` to
make it clear to ruby our intention of invoking the three setter methods `height` `weight`
and `name`.
=end
