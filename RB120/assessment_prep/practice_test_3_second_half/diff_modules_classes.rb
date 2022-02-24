=begin
Describe the distinction between modules and classes.

modules are instances of the `Module` class. classes are instances of the `Class` class.

Classes are used as blueprints for objects; they're where we define an object's behaviors
and potential attributes. We also define class methods inside of classes and can instantiate
objects from classes via the `::new` method. Classes can inherit the behavior of superclasses;
modules cannot inherit from other modules.

Unlike Classes, modules are incapable of instantiating objects. They are used in two primary
capacities. One: as namespaces and two: as mixins. A module that's being used as a namespace
is a container for a bunch of similar, or related classes whereas a mixin is a module that
we use to give various classes desired behaviors, access to constants, and other functionality
related concerns. We mix-in functionality to a class via interface inheritance.

A common visual distinction between the two would be that a mixin module would follow
the suffix "-able" naming convention while a namespace's name would typically relate to
some shared trait or enclosing purpose that the classes contained therein have.
=end
