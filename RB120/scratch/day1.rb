# require 'time'

# class Vehicle
#   attr_accessor :color, :speed
#   attr_reader :model, :year
#   @@number_of_vehicles = 0

#   def initialize(year, color, model)
#     @@number_of_vehicles += 1
#     @year = year
#     @color = color
#     @model = model
#     @speed = 0
#   end

#   def age
#     "your #{self.model} is #{age_of_car} years old."
#   end

#   def gas(mph = 10)
#     @speed += mph
#   end

#   def brake(mph)
#     @speed -= mph
#   end

#   def shut_off 
#     @speed = 0
#   end

#   def spray_paint(color)
#     self.color = color
#   end

#   def self.vehicle_count
#     @@number_of_vehicles
#   end

#   def self.mileage(distance, gas_burned)
#     puts "Your mileage is #{(distance/gas_burned).round(1)} miles per gallon."
#   end

#   def type_of_vehicle(vehicle_type)
#     vehicle_type
#   end

#   private

#   def age_of_car
#     Time.new.year - self.year
#   end
# end

# class MyTruck < Vehicle
#   SOME_CONSTANT = "this is a truck"
#   def type_of_vehicle
#     SOME_CONSTANT
#   end

#   def to_s
#     "My #{self.year} #{self.color} #{self.model} is a pretty truck!"
#   end
# end

# module Driftable 
#   def drift 
#     "Way to drift your #{self.color} #{self.model}!  It look stunning!"
#   end
# end

# class MyCar < Vehicle
#   include Driftable

#   SOME_CONSTANT = "this is a car"
#   def type_of_vehicle
#     super(SOME_CONSTANT)
#   end

#   def to_s
#     "My #{self.year} #{self.color} #{self.model}' is a pretty car!"
#   end
# end

# car = MyCar.new(2010, 'Yellow', "Subaru")
# truck = MyTruck.new(2316, 'blue', 'international')

# p car.age

# class Student
#   def initialize(name, grade)
#     @name = name
#     @grade = grade
#   end

#   def greeting
#     hi
#   end

#   def better_grade_than?(other_student)
#     grade > other_student.grade
#   end

#   private

#   def hi
#     puts "hi there!"
#   end
#   # protected
#   # def grade
#   #   @grade
#   # end
# end

# # joe = Student.new("joe", 89.5)
# nick = Student.new("nick", 54.9)

# # puts "good job" if joe.better_grade_than?(nick)

# nick.greeting 



# class Person
#   attr_accessor :first_name, :last_name

#   def full_name
#     self.first_name + ' ' + self.last_name  
#   end
# end

# mike = Person.new
# mike.first_name = 'Michael'
# mike.last_name = 'Garcia'
# p mike.full_name # => 'Michael Garcia'
