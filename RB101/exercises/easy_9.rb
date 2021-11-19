#   Problem 1

# Create a method that takes 2 arguments, an array and a hash. The array will contain 2 or more elements that,
# when combined with adjoining spaces, will produce a person's name. The hash will contain two keys, :title and
# :occupation, and the appropriate values. Your method should return a greeting that uses the person's full name,
# and mentions the person's title and occupation.


# P   given arr and hash, generate a greeting
# E
# D
# A
#   declare a variable sentence, empty string
#   combine array elements, add to empty string, same for hsh
# C
def greetings(arr, hsh)
  sentence = "Greetings "
  name = ""
  occupation = ""
  name << arr.join(" ")
  occupation << hsh.values.join(" ")
  sentence + name + "! " + occupation + '.'
end
# p greetings(["joel", 'barton'], {:title => "master", :occupation => "archanist"})

#   Problem 2

# A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits.
# For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

# Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.

# p 42.to_s.split('')[0].to_i
# P   rules: if length is odd, double int value.
# E
# D
# A
#   convert to string rep, split into array to count length
#   if length is odd, convert back to  integer and return that value, not double
#   if length even
# C

def twice(number)
  str = number.to_s
  if str.size.odd?
    return number * 2
  elsif str.size.even?
    half = str.slice(0, str.size/2)
    other_half = str.slice((str.size/2) - 1, str.size/2)
    if half.to_i == other_half.to_i
      str.to_i
    else
      str.to_i * 2
    end
  end
end
# p twice(5)

#   Problem 3

# Write a method that takes a number as an argument. If the argument is a positive number, return the negative of that number.
# If the number is 0 or negative, return the original number.

# P i: number, positive or negative self
# E
# D
# A
#   if zero or negative, return original number
#   positive, return negative self
# C
def negative(number)
  (number.zero? || number.negative?) ? number : number * -1
end
# p negative(-24)

#   Problem 4

# Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.

# You may assume that the argument will always be a valid integer that is greater than 0.

# P
# E
# D
# A
#   init empty array, invoke upto with 1 and integer as arguments, assign block variable num upon each iteration, push num to arr, return arr
# C
def sequence(integer)
  arr = []
  1.upto(integer) do |num|
    arr.push(num)
  end
  arr
end
# p sequence(15)

#   Problem 5

# Write a method that takes a string argument, and returns true if all of the alphabetic characters inside the string are uppercase,
# false otherwise. Characters that are not alphabetic should be ignored.
def uppercase?(string)
  string == string.upcase
end
# p uppercase?('ASDF2134')

#   Problem 6   Finished under 6 minutes

# Write a method that takes a string as an argument, and returns an Array that contains every word from the string, to which you have
# appended a space and the word length.

# You may assume that words in the string are separated by exactly one space, and that any substring of non-space characters is a word.


# P
# E
# D
# A
#   split string
#   transform sting array using collect
#   upon each iteration, transform element
#   return our new array!
# C
def words_length(string)
  arr = string.split
  new_arr = arr.collect do |el|
    el += " #{el.length}"
  end
  new_arr
end
# p words_length("joel had a great little dog named rascal")

#   Problem 7   under 2 minutes

# Write a method that takes a first name, a space, and a last name passed as a single String argument, and returns a string that contains
# the last name, a comma, a space, and the first name.

def swap_name(full_name)
  flipped = full_name.split.reverse
  flipped.fetch(0) << ", "
  flipped.join
end
# p swap_name("Katherine Mershon")

#   Problem 8   finished under 7 minutes

# Create a method that takes two integers as arguments. The first argument is a count, and the second is the first number of a sequence
# that your method will create. The method should return an Array that contains the same number of elements as the count argument, while
# the values of each element will be multiples of the starting number.

# You may assume that the count argument will always have a value of 0 or greater, while the starting number can be any integer value.
# If the count is 0, an empty list should be returned.

# P
# E
# D   array
# A
#   if count = 0, return empty array
#   else
#     multiply_by = 2
#   count times...
#     add start times multiply_by to array
#     increment multiply_by by 1
#   return array
# C
def sequence(count, start)
  arr = []
  arr if count == 0
  multiply_by = 1
  count.times do
    arr.push(start * multiply_by)
    multiply_by += 1
  end
  arr
end
# p sequence(13, -5)

#   Problem 9   Under 7

# Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade.


# P
# E
# D
# A
# C
def get_grades(one, two, three)
  score = ((one + two + three)/3)
  if 90 <= score && score <= 100
  	'A'
  elsif 80 <= score && score < 90
    'B'
  elsif 70 <= score && score < 80
    'C'
  elsif 60 <= score && score < 70
    'D'
  elsif 0 <= score && score < 60
    'F'
  end
end
# p get_grades(99, 0, 97)

#   Problem 10  Finished under 5

# Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.


# P
# E
# D
# A
#   initialize empty array
#   iterate over input array and pass block
#   push first element of each element to empty array second element number of times
#   return new array
# C

def buy_fruit(array_of_arrays)
  basket = []
  array_of_arrays.each do |el|
    el[1].times { basket.push(el[0])}
  end
  basket
end
# p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]])


#   Problem 11  Took a while


# Contrary to the LS commentary, I found the anagram-identification aspect to be generally straight forward.
# However, my certainty took a dive as soon as I needed to do something with those anagrams (generate separate anagram groups).

# My Logic

# 1) create ARRAY of sub arrays, each containing the ALPHABETIZED & original
# 2) create HASH where each pair is grouped together under a unique key
# 3) invoke nested collect methods (which is intuitive since the has values are nested arrays)
# 4) and return yet another array of anagram clusters


words = ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']

def alpha(word)
  word.chars.sort.join
end

pairs = words.each_with_object([]) {|word, arr| arr << [alpha(word), word] }
hash = pairs.group_by { |pair| pair[0] } # hash's values are pretty ugly atm
anagram_clusters = hash.collect {|key, value| value.collect{|original| original[1]}}
