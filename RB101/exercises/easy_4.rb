# 1.

# def short_long_short(one, two)
#   one.size > two.size ? two + one + two : one + two + one
# end

# p short_long_short('123456', 'jkl;o')

# 2.
# Problem
  # i: integer
  # o: string
# Example/test
# Data structure
  # arrays
# Algorithm
  # integer input
  # based on last character, determine suffix ()
  # figure out length of input ()
  #
# Code

# def which_suffix?(the_century)

#   case the_century.to_s[-1]
#   when '1'
#     'st'
#   when '2'
#     'nd'
#   when '3'
#     'rd'
#   else
#     'th'
#   end

# end

# def which_century?(year)
#   return "1st" if year < 101
#   century = (year / 100) + 1
#   "#{century}" + which_suffix?(century)
# end

# puts which_century?(9001)

# 3.

# Rules:
  # leap year occur every year that is perfectly divisible by 4,
    # unless that year is also perfectly divisible by 100
    # in this case it is not a leap year
      # unless it is also divisible by 400
        # then, leap year
# def leap_year?(year)
#   if (year % 4).zero?
#     if (year % 100).zero?
#       if (year % 400).zero?
#         true
#       else
#         false
#       end
#     else
#       true
#     end
#   else
#     false
#   end
# end

# def pre_1752(year)
#   (year % 4).zero?
# end

# def post_1752(year)
#   if (year % 400).zero?
#     true
#   elsif (year % 100).zero?
#     false
#   else
#     (year % 4).zero?
#   end
# end

# def leap_year?(year)
#   year >= 1752 ? post_1752(year) : pre_1752(year)
# end

# 4.
# Problem
  # i: num
  # o: sum of multiples up to num
# Example/test
  # i = 15
  # [3,5,9,10,12,15] . sum
  # o = 54

# Data structure
  # array
# Algorithm
  # START
  # initialize storage array
  # starting from 1... up to input
    # is multiple of 3 or 5 ?
      # plop in storage
      # otherwise, go next
  # sum up elements in our storage array
  # return that sum


# Code
# def multisum(input, storage = [])

#   (1..input).each do |number|
#     storage.push(number) if (number % 5).zero? || (number % 3).zero?
#   end

#   storage.inject(:+)
# end

# 5.
# Problem
  # i: array of numbers
  # o: modified array of numbers
# Example
# Data Structure => arrays
# Algorithm
# Code

# def running_total(init)
#   output = []

#   init.each_index do |index|
#     break if init.empty?

#     next output.push(init[index]) if index == 0
#     curr = init[index]
#     prev = output[index-1]
#     output.push(curr + prev)
#   end

#   output
# end

# def running_total(init)
#   curr_total = 0
#   output = init.map { |el| curr_total += el }
# end

# 7.
# Problem
  # i: string
  # o: integer
# Examples
  # string_to_integer('4321') == 4321
  # string_to_integer('570') == 570

# Data Structure => maybe an array cache of acceptable values
# Algorithm
  # initialize two arrays, one containing integer values, the other string counterparts
  # split input into strings
  # iterate across new array
    # check if element is in string counterparts array (index of?)
    # pass that index to integer value array and select appropriate value
    # push that value to output array
    # reduce
# Code

# STRINGS = %w(0 1 2 3 4 5 6 7 8 9)
# INTEGERS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

# def negate(our_integer) # returns -value
#   -our_integer
# end

# def string_to_integer(our_string)
#   our_string_array = our_string.split('')

#   sign = our_string_array.shift if our_string_array[0] == '-' || our_string_array[0] == '+'

#   integer_array = our_string_array.map { |el| INTEGERS[STRINGS.index(el)] }
#   our_output = integer_array.reduce {|accum, curr| accum*10 + curr }

#   sign.nil? || sign == '+' ? our_output : negate(our_output)
# end

# p string_to_integer('-1234')
# 8.

# STRINGS = %w(0 1 2 3 4 5 6 7 8 9)
# INTEGERS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

# def negate(our_integer) # returns -value
#   -our_integer
# end

# def string_to_integer(our_string)
#   our_string_array = our_string.split('')

#   sign = our_string_array.shift if our_string_array[0] == '-' || our_string_array[0] == '+'

#   integer_array = our_string_array.map { |el| INTEGERS[STRINGS.index(el)] }
#   our_output = integer_array.reduce {|accum, curr| accum*10 + curr }

#   sign.nil? || sign == '+' ? our_output : negate(our_output)
# end

# p string_to_integer('-1234')
# 9.

# how do we iterate across
# number = 1234


# p string

# STRINGS = %w(0 1 2 3 4 5 6 7 8 9)

# def integer_to_string(integer)
#   string = "#{number}"
# end


def integer_to_string(integer)
  inverted_integer_array = integer.digits
  integer_array = inverted_integer_array.reverse!
  string = ""
  integer_array.each { |el|  }
  string
end

p integer_to_string(1234)

# 10.


# print integers.inject{|initial,i| a*10 + i}
# string_to_integer('asdf')