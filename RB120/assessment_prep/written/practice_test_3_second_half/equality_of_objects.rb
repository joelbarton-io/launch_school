class Cat
end

whiskers = Cat.new
ginger = Cat.new
paws = Cat.new

=begin
If we use == to compare the individual Cat objects in the code above,
will the return value be true? Why or why not? What does this demonstrate
about classes and objects in Ruby, as well as the == method?

No, given the above code if we compare any of our `Cat` objects, `true` will
never be returned. This is because of how the `BasicObject#==` method is implemented.
`BasicObject#==` will only return `true` if what is being compared is the exact same object.
Every time we instantiate a `::new` `Cat` object, that object is located at a unique memory
address, so if we compare two of these objects, the comparison will return `false`.

Unique instances of the same class have unique object ids; therefore they're not the same
object even if their states are identical.
=end
