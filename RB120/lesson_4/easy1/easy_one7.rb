# What is the default return value of to_s when invoked on an object?
# Where could you go to find out if you want to be sure?

=begin

stringified ClassName followed by some seemingly random characters, then the current state of the object

We could check the Class definition to see if a custom-to-class `to_s` method is defined or not.


By default, `to_s` doesn't actually include the current state of the object