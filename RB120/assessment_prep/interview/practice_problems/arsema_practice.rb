






=begin
Collaborator objects.

mention: not just custom class' instances (core library too!)
=end

# class Library
#   attr_reader :book

#   def initialize
#     @book = []
#   end
# end

# class Book; end

# public_library = Library.new
# notw = Book.new
# public_library.book << notw # Book object notw

# method access control

# we group behaviors in classes; classes encapsulate behavior
# Module public, private, protected

# class Person
#   attr_writer :name

#   def initialize(name)
#     @name = name
#   end

#   def ==(other)
#     name == other.name
#   end

#   private # only allowed to involve one instance

#   attr_reader :name
# end

# joel = Person.new("Joel")
# frank = Person.new("Frank")

# p joel == frank # frank is the explicit receiver!

# no formal relationship

# objects of different types (classes) can respond to the same interface

# class Athlete
#   def attend
#     puts "plays"
#   end
# end

# class Parent
#   def attend
#     puts "cheers"
#   end
# end

# class Vendor
#   def attend
#     puts "sells food"
#   end
# end

# class Ref
#   def attend
#     puts "officiates"
#   end
# end

# def sports_game(attendees)
#   attendees.each(&:attend)
# end

# attendees = [Athlete.new, Parent.new, Vendor.new, Ref.new]

# sports_game(attendees)

# duck typing!

# class School
#   def initialize
#     @trait = 'School 1'
#   end
# end

# class School # shadowing?
#   def initialize
#     @trait = 'School 2'
#   end
# end

# module Primary

# end

# school = School.new
# p school

# primary_school = Primary::School.new
# p primary_school

# disambiguate between classes that happen to have the same name!
# preventing name collisions
# 'exact' definition of namespace
# make examples more simple!

# class Person
#   def initialize(name)
#     @name = name
#   end

#   def self.make_object(name)
#     new(name)
#   end
# end

# joel = Person.make_object("Joel")
# p joel
