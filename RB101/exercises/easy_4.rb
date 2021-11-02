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

# rules:
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

# 5.
# 6.
# 7.
# 8.
# 9.
# 10.