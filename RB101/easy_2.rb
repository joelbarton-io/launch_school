def prompt(msg) print "=> #{msg} " end 
def age() rand(20..200) end

def format_number(num)
  two_decimal_number = num.round(2)
  whole, decimal = two_decimal_number.to_s.split(".")
  num_groups = whole.chars.to_a.reverse.each_slice(3)
  whole_with_commas = num_groups.map(&:join).join(',').reverse
  [whole_with_commas, decimal].compact.join(".")
end

# should deconstruct this method, i don't quite understand its logic and 
# would like to have a better understanding of &:method implementation.

# 1 Random number
# teddy_age = Array(20..200).sample
# teddy_age = rand(20..200)
# teddy_age = %w(1..200)
# teddy_age = (20..200).lazy.first(182)
# puts teddy_age
# FE
# prompt("Name:")
# name_input = gets.chomp()
# name_input.empty? ? prompt("Teddy's age: #{age}") : prompt("#{name_input}'s age: #{age}")


# 2 area
# MEET_2_FEET = 10.7639
# prompt("Enter length in meters:")
# length_meters = gets.to_f

# prompt("Enter width in meters:")
# width_meters = gets.to_f

# area_meters = width_meters * length_meters
# area_feet = area_meters * MEET_2_FEET
# prompt("The area of the room is #{area_meters.round(2)} \
# square meters (#{area_feet.round(2)} square feet).")


# 3
# prompt("What is the bill? \n
# ==>")
# bill = gets.to_f.round(2)
# prompt("What is the tip percentage? \n
# ===>")
# tip_percent = gets.to_f.round(2)

# tip_value = bill * (tip_percent / 100)
# total = bill + tip_value

# FE
# tip_value = sprintf("%.2f", tip_value)
# total = sprintf("%.2f", total)

# prompt("The tip is $#{tip_value}")
# prompt("The total is $#{total}")

# 4
# require 'date'
# this_year = Date.today.year.to_i

# prompt("What is your age?")
# current_age = gets.chomp.to_i

# prompt("At what age will you retire?")
# retirement_age = gets.chomp.to_i

# years_left = retirement_age - current_age

# prompt("It is #{this_year}. You will retire \
# in the year #{this_year + years_left}.\n")
# prompt("You only have #{years_left} years left!\n")

# 5

# prompt("What is your name?")
# your_name = gets.chomp

# unless your_name[-1] == "!"
#   prompt("hello #{your_name.capitalize()}".capitalize)
# else
#   prompt("Hello #{your_name}. why are we screaming?".upcase)
# end 


# 6

# Problem
# input = none
# output = every odd number, printed to the console, on its own line

# Example =>  3 \n
# DS => n/a

# Algorithm 
# start with a range
# use iterator (.each comes to mind)
# condition: odd? 
# print number to console

# Code
# (1..99).filter {|num| puts num if num.odd?} # ARRAY METHOD
# puts (1...100).to_a.keep_if {|num| num.odd?} 
# 1.upto(99) {|num| puts num if num.odd?} # INTEGER METHOD

# 7
# ' '
# Problem
# Example
# Algorithm
# DS
# Code
# 1.upto(99) {|num| puts num if num.even?} # INTEGER METHOD


# 8
# Problem
# in = integer > 0
# out = either sum or product of all ints between input and 1

# Example
# in = 5, want sum
# out = 5+4+3+2+1 = 15

# Algorithm
# ask for int and operation
# if sum, add nums 1-input
# if prod, input!

# DS => none, unless we choose to generate an array

# Code

prompt("Please enter an integer greater than 0:")
input_n = gets.chomp.to_i
array = (1..input_n).to_a

prompt("Enter 's' to compute the sum, 'p' to compute the product.")
input_op = gets.chomp.downcase

if input_op == 's'
  sum_of_n = array.inject(:+)
  puts "The sum of the integers between 1 and #{input_n} is #{format_number(sum_of_n)}"
elsif input_op == 'p'
  prod_of_n = array.reduce(:*) #alias of .inject
  puts "The product of the integers between 1 and #{input_n} is #{format_number(prod_of_n)}"
end 

# 9
# Problem
# on line 1, we tell the label 'name' to point at the memory address containing
#   the string 'Bob'
# on line 2, we tell the label 'save_name' to point at the same memory address
#   that the label 'name' is pointing at (which contains the string 'Bob')
# on line 3, we mutate the string value assigned to 'name' with the .upcase!
#   method, mutating in place the string 'Bob' => 'BOB'
# on line 4, we print out the values associated with 'name' and 'save_name'

# 10

# got this one wrong! :(
