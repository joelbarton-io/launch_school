module Crawlable
  def crawl
    puts 'is crawling'
  end
end

class Parent
  def run
    puts 'running fast'
  end

  def sleep
    puts 'on and off!'
  end
end

class Child < Parent
  include Crawlable

  def run
    puts 'running slow'
  end
end

class Sloth
  include Crawlable

  def sleep
    puts 'all day long'
  end
end

[Child.new, Sloth.new].each(&:crawl) # polymorphism via interface inheritance
[Child.new, Parent.new].each(&:run)
[Parent.new, Sloth.new].each(&:sleep) # polymorphism via duck typing


=begin
What is polymorphism and how can we implement polymorphism in Ruby? Provide examples.

Polymorphism is the ability of different types of objects to respond to the same
interface (method invocation) while having different specific implementations.
There are two ways to implement polymophism: inheritance and duck-typing.
Within inheritance, there are two forms: class and interface.

We achieve polymorphic behavior on line 35 by `include`ing `Crawlable` in both the
`Sloth` and `Child` classes.

We achieve polymorphic behavior on line 34 via class inheritance and method overriding.

While no formal relationship exists between `Sloth` and `Parent`, since both
have an instance method called `sleep`, they can both have `sleep` called on them
with their own unique implementations, thus exhibiting polymorphic behavior.

It should also be noted that for some behavior to be considered polymorphic, it should be
intentional.
=end
