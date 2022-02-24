=begin
What is encapsulation, and why is it important in Ruby? Give an example.

Encapsulation is how we establish boundaries in our program; it allows us to write more
maintainable and complex code; classes contain behaviors and objects have state.

At the class-level, encapsulation takes the form of grouping behaviors within classes and
through the use of access modifiers like `public` `private` and `protected`. We can choose to
restrict access to aspects of implementation by making certain methods only available and
callable from within the class itself.

At the object-level, encapsulation is implemented through `@instance_variables` which keep track
of information stored as state in the object in question. The only way to access the values stored
by an object’s instance variables is through the interface (getters & setters) established in the
class of the object in question. This is how encapsulation works at the object-level.

All of this is important because it helps us to achieve a greater level of data protection and
makes it much harder to unintentionally manipulate some data or invoke some method erroneously.
=end
