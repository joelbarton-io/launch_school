# easy 3 problems

# 1.
# Problem
#   i: 6 integers
#   o: does 6th num appear in 5 previous

# Examples
# xx

# Data Structures
#   array

# Algorithm
#   prompt user 6 times for a number
#   store first 5 in an array
#   check if array contains 6th number
#     yes/no

# Code

order = %w(1st 2nd 3rd 4th 5th last).freeze
stored_numbers = []

order.each do |el|
  puts "Enter the #{el} number: "
  stored_numbers.push(gets.chomp.to_i)
end

last_number = stored_numbers.pop()

if stored_numbers.include? last_number
  puts "The number #{last_number} appears in #{stored_numbers}."
else
  puts "The number #{last_number} does not appear in #{stored_numbers}."
end

# 2.
# Problem
#   i: two positive ints
#   o: six operations and their results

# Examples
# n/a

# Data Structures
# n/a

# Algorithm

# ..
# Code



# 3.
# Problem
# Examples
# Data Structures
# Algorithm
# Code

# 4.
# Problem
# Examples
# Data Structures
# Algorithm
# Code

# 5.
# Problem
# Examples
# Data Structures
# Algorithm
# Code

# 6.
# Problem
# Examples
# Data Structures
# Algorithm
# Code

# 7.
# Problem
# Examples
# Data Structures
# Algorithm
# Code

# 8.
# Problem
# Examples
# Data Structures
# Algorithm
# Code

# 9.
# Problem
# Examples
# Data Structures
# Algorithm
# Code

# 10.
# Problem
# Examples
# Data Structures
# Algorithm
# Code



