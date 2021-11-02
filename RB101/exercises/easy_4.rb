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

def running_total(init)
  output = []

  init.each_index do |index|
    break if init.empty?

    next output.push(init[index]) if index == 0
    curr = init[index]
    prev = output[index-1]
    output.push(curr + prev)
  end

  output
end

# running_total([2, 5, 13]) == [2, 7, 20]
# running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# running_total([3]) == [3]
# running_total([]) == []
# 7.
# Problem
  # i: array of numbers
  # o: modified array of numbers
# Example
# Data Structure => arrays
# Algorithm
# Code
# 8.
# 9.
# 10.