class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

al = Person.new('Alexander')
alex = Person.new('Alexander')
p al == alex # => true

=begin
In the code above, we want to compare whether the two objects have the same name.
Line 11 currently returns false. How could we return true on line 11?

Further, since al.name == alex.name returns true, does this mean the String objects referenced
by al and alex's @name instance variables are the same object? How could we prove our case?


We need to define a custom `Person#==` instance method to compare the values of the two
`Person` object's `@name` instance variables.

The method would look something like the following.

```ruby
  def ==(other)
    name == other.name
  end
```

The above implementation would compare the value of the two `Person` object's `@name` instance
variables.  As both instance variables reference the same value (e.g. 'Alexander') and since we
are using the `String#==` within our `Person#==` method, line 11 will now print `true`.

They are not the "same" String object. The String objects referenced by `al` and `alex`'s `@name`
instance variables are both strings that store the same value `Alexander`, however they are
entirely unique objects.

One way to demonstrate this is by using a different form of equality comparison. Utilizing
`BasicObject#equal?` comes to mind. Lets implement that in our custom `Person#==` method below.

```ruby
  def ==(other)
    name.equal?(other.name)
  end
```

When line 11 runs this time around, `false` will be printed since `BasicObject#equal?` compares
object ids.
=end
