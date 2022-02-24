class Klass
  def initialize(name, age); @name, @age = name, age; end

  def greet; end

  def compare_ages(other)
    age == other.age
  end

  private

  attr_reader :name

  protected

  attr_reader :age
end
=begin
How is Method Access Control implemented in Ruby?
Provide examples of when we would use public, protected, and private access modifiers.

Method access control is implemented the three `Module` methods `public` `private` and
`protected`. Unless we specify otherwise, all methods defined in a custom class are classified as
`public` in terms of their visibility.

In the above code `Klass#greet` and `compare_ages` are both part of the class' public
interface meaning that both can be accessed from outside the class (and in this example,
invoked upon instances of the `Klass` class).

However, the `name` getter method defined on line 12 is only callable from within the
class definition since it is designated as private.

While we can't call the  `age` getter method from outside the class, we can call it
from within the class within another method. Additionally, we can involve multiple
instnaces of the `Klass` class. In our example, we see this functionality within the
`compare_ages` implementation.
=end
