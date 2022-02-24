class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "My name is #{name.upcase!}."
  end
end

bob = Person.new('Bob')
puts bob.name
puts bob
puts bob.name
=begin
What is output on lines 14, 15, and 16 and why?

- we modified the state of the `Person` object referenced by local variable `bob`
since we used the mutating form of `String#upcase!` on line 9.

init -> invoke name getter -> puts -> custom to_s -> mutating `upcase!` ->  name getter

output:

Bob
My name is BOB.
BOB

-----------------

On line 13, we initialize a new `Person` object referenced by local variable `bob`.

Instance variable `@name` references the string value `Bob`. `@name` and its value
are stored as state for the aforementioned `Person` object.

On line 14, we print the value returned from invoking the `name` getter method. `'Bob'`
is printed to the screen.

On line 15, we invoke `puts` and pass it the `Person` object referenced by `bob`. Since
`puts` calls `to_s` on its argument, `to_s` is called on `bob`. The custom `to_s` method
defined within `Person` is invoked (overriding `Object#to_s`). Within this custom implementation
of `to_s` we invoke the mutating `upcase!` on the value returned by the `name` getter method,
thus mutating the value of the string referenced by `@name`. The string "My name is BOB." is
printed to the screen.

And since the value referenced by `@name` was mutated previously, when we invoke `name` upon
`bob`, we see "BOB" printed to the screen.

Although not extremely pertinent to this particular question, it bears mentioning that when we
interpolated the return value of `name.upcase!` within our custom `to_s`, the `String#to_s` was
called on this return value automatically.
=end
