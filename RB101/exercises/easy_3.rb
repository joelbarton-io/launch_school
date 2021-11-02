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


# order = %w(1st 2nd 3rd 4th 5th last).freeze
# stored_numbers = []

# order.each do |el|
#   puts "Enter the #{el} number: "
#   stored_numbers.push(gets.chomp.to_i)
# end

# last_number = stored_numbers.pop()

# if stored_numbers.include? last_number
#   puts "The number #{last_number} appears in #{stored_numbers}."
# else
#   puts "The number #{last_number} does not appear in #{stored_numbers}."
# end


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


# operations_array = %i(+ - * / % **)

# puts "=> Enter the first number:"
# first = gets.chomp.to_f
# puts "=> Enter the second number:"
# second = gets.chomp.to_f

# operations_array.each do |operation|
#   result =  [first, second].inject(operation).round(2)
#   puts "#{first} #{operation} #{second} = #{result}"
# end


# 3.
# Problem
#   i: string
#   o: string

# Examples
# ..

# Data Structures
#   array

# Algorithm
#   prompt user for string
#   store string in variable
#   split, join, size string and store in new variable
#   print to screen a message

# Code

# puts "Please write word or multiple words: "
# phrase = gets.chomp
# length = phrase.split.join.size
# puts "There are #{length} characters in #{phrase}"


# 4.
# Problem
# Examples
# Data Structures
# Algorithm
# Code

# array_1 = [1,2,3,4,5]
# p array_1
# array_2 = array_1 * 2
# p array_2

# puts array_1.object_id
# puts array_2.object_id


# 5.
# Problem
# Examples
# Data Structures
# Algorithm
# Code

# def multiply(num1, num2)
#   num1 * num2
# end

# def to_the_nth(number, nth = 1)
#   multiply(number, 1) ** nth
# end

# puts result

# 6.
# Problem
#   i: two arguments, either truthy or falsey
#   o: true or false
# Examples
# Data Structures
# Algorithm
# Code



# def xor?(arg1, arg2)
#   if arg1
#     if arg2
#       false
#     elsif !arg2
#       true
#     end
#   else # implicitly arg1 is falsey
#     if arg2
#       true
#     elsif !arg2
#       false
#     end
#   end
# end


# def xor?(arg1, arg2)
#   arg1 != arg2
# end

# def xor?(bool1, bool2)
#   [bool1, bool2].uniq.size == 2
# end


# 7.
# Problem
#   i: int array
#   o: array of odd elements
# Examples
# Data Structures
# Algorithm
# Code

# def oddities(array)
#   out_array = []
#   array.each_with_index do |el, idx|
#     out_array.push(el) if idx.even?
#   end
#   puts " #{array} => #{out_array}"
# end

# def oddities(array)
#   odds = []
#   index = 0
#   while index < array.length
#     odds.push(array[index])
#     index += 2
#   end
#   odds
# end

# print oddities([12,2,"a",4,5, nil])

# 8.
# Problem
#   i: string
#   o: boolean true or false

# Examples
# Data Structures
# Algorithm
#   pass in string arg
#
# Code

# def palindrome?(word)

#   front = 0
#   back = word.length-1
#   is_palindrome = true

#   while back > front
#     break is_palindrome = false if word[front] != word[back]
#     front += 1
#     back -= 1
#   end
#   is_palindrome
# end


# def palindrome?(string)
#   string == string.reverse
# end


def palindrome?(string)
  # string.downcase.gsub(/[^0-9a-z ]/i, '')
  string == string.reverse
end

# puts palindrome?('joel,,s,,,,leosj')

# 9.
# Problem
# Examples
# Data Structures
# Algorithm
# Code

# def palindromic_number?(numbers)
#   palindrome?(numbers.to_s)
# end

# puts palindromic_number?(1234545434321)
# 10.
# Problem
# Examples
# Data Structures
# Algorithm
# Code



