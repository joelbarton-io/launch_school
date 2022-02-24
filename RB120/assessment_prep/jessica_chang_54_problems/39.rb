class Thing
end

class AnotherThing < Thing
end

class SomethingElse < AnotherThing
end

# Describe the inheritance structure in the code above, and identify all the superclasses.
=begin
`SomethingElse` inherits from `AnotherThing` which inherits from `Thing` which inherits from
`Object` which inherits from `BasicObject`

If we were to include included modules in our "inheritance structure", our inheritance structure
would look like this: [SomethingElse, AnotherThing, Thing, Object, Kernel, BasicObject].
=end
p SomethingElse.ancestors
