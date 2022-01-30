=begin

What are the benefits of using Object Oriented ruby?

-> enables class and interface inheritance
-> allows for encapsulation (both in terms of the scope of instance variables
as well as concealing special functionality contained within classses)
-> encapsulation also allows for

-> custom objects, custom (overriding) methods that we can define to work in specific
   manners depending on how we need certain objects to work (this is weak)
-> modules!  Shared, as-needed functionality in the form of included modules
  -> this is how ruby addresses the lack of multiple inheritance.
  -> or rather, modules are the way that ruby implements single inheritance with
     most of the functionality of multiple inheritance (via modules)
-> inheritance, encapsulation, and abstraction

Did not mention
-> easier to manage growing complexity (all those scope gates!!!)
-> fewer namespacing issues!!
-> Objects are represented as nouns, which makes them easier to conceptualize
-> allows us to build applications faster because we can reuse more code
-> allows us to extend functionality to different parts of our application without duplication
-> enables us to be selective with where certain functionality is accessible and by whom (type of object)
