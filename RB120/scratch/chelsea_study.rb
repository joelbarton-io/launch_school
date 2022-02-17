class House
  #include Comparable
  attr_reader :price
  def initialize(price)
    @price = price
  end

  # def ==(other)               # House#==
  #   self.price == other.price # Integer#==
  # end
end

# ==, eql?, ===, equal?

house1 = House.new(23)
house2 = House.new(42)

p house1.eql?(house2)

equal?

case 3
when 3..4 then xcjj # range#===
when 4 then sdjfjf # object#===


# module ModA  # lexical ('positional') scope
#   module ModB

#     class Parent
#       CONST = 'AHHHHH'

#       def a_method
#         p "#{ModD::Parent::CONST}" # ModA::ModB::Parent::CONST vs. Parent::CONST
#       end
#     end

#     class Child < Parent
#       CONST = 'HELLO from INSIDE CHILD'
#     end
#   end

# end


# module ModD
#   class Parent
#     CONST = 'Hello from Parent 1' # TARGET
#   end

#   class Child < Parent
#     def a_method
#       puts " #{ModA::ModB::Child::CONST}"
#     end
#   end
# end

# #Child.new.a_method
# ModA::ModB::Parent.new.a_method # AHHHHHH

#   Class variables



# good usecase and why it's appropriate

class Klass
  puts 'klass'
  @@Klass_count = 1

  # def initialize
  # end

  def output_count
    @@Klass_count
  end
end

class UnterKlass < Klass
  puts 'unterklass'
  @@Klass_count  = 2
end



class Dos < UnterKlass
  puts 'dos'
  @@Klass_count = 3
end

# all class share one copy of class variable!
# Klass -> UnterKlass -> Dos

x = Dos.new
y = UnterKlass.new
z = Klass.new

p x.output_count # 3
p y.output_count # 3
p z.output_count # 3

#




















