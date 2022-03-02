=begin
Inside a preschool there are children, teachers, class assistants, a principle, janitors, and cafeteria workers.
Both teachers and assistants can help a student with schoolwork and watch them on the playground. A teacher teaches
and an assistant helps kids with any bathroom emergencies. Kids themselves can learn and play. A teacher and principle
can supervise a class. Only the principle has the ability to expel a kid. Janitors have the ability to clean. Cafeteria
workers have the ability to serve food. Children, teachers, class assistants, principles, janitors and cafeteria
workers all have the ability to eat lunch.

Children, Teachers, Class Assistants, Principles, janiitors, cafeteria staff.

help_with_school_work, supervise_recess, teaches, bathroom_emergencies, learn, play, supervise_class,
expel, clean, eat lunch
=end
module Supervisable
  def supervise_class; end
end

class Human
  def eat; end
end

class Principle < Human
  include Supervisable
  def expel; end
end

class Instructor < Human
  def help_with_school_work; end

  def supervise_recess; end
end

class Assistant < Instructor
  def bathroom_emergencies; end
end

class Teacher < Instructor
  include Supervisable
  def teach; end
end

class CafeteriaStaff < Human
  def serve_food; end
end

class Student < Human
  def learn; end

  def play; end
end

class Janitor < Human
  def clean; end
end
