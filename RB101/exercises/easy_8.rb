#   Problem 1   UNDER 7 minutes

# Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence
# for that Array. You may assume that the Array always contains at least one number.

def sum_of_sums(array)
  sum = 0
  array.each_with_index do |_, index|
    sum += array.slice(0, index + 1).inject(:+)
  end
  sum
end
# p sum_of_sums([3, 5, 2])
# p sum_of_sums([1, 5, 7, 3])
# p sum_of_sums([4])
# p sum_of_sums([1, 2, 3, 4, 5])


#   Problem 2   In 5:30

# Mad libs are a simple game where you create a story template with blanks for words. You, or another player, then construct
# a list of words and place them into the story, creating an often silly or funny story as a result.
# Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and an adjective and injects those into a story that you create.
def prompt(message)
  puts ">>>#{message}:"
end

# prompt "noun"
# noun = gets.chomp
# prompt "verb"
# verb = gets.chomp
# prompt "adverb"
# adverb = gets.chomp
# prompt "adjective"
# adjective = gets.chomp

# puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? So funny!"


#   Problem 3   Managed to PEDAC and implement in under 7 minutes, happy with this one.

# Write a method that returns a list of all substrings of a string that start at the beginning of the original string.
# The return value should be arranged in order from shortest to longest substring.

# i : single string object
# o : array of size string.length, containing substrings that start with first letter in string and end at current index

# string => array of sub strings

# algo
#   var to store, empty array
#   split string
#   traverse split string
#   push this => slice(0, cur index) into array
# end
# return array

def leading_substrings(string, start=0)
  result = []
  arr = string.split('')
  arr.each_with_index do |char, ind|
    result.push(arr.slice(start, ind+1).join)
  end
  result.flatten()
end
# p leading_substrings('abc')
# p leading_substrings('a')
# p leading_substrings('xyzzy')

#   Problem 4

# Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins.
# This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on.
# Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.

# You may (and should) use the leading_substrings method you wrote in the previous exercise:

# i : string object
# o : array of strings

# substrings('abcde') == [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]

# algo
# start
#   get number of passes which will equal string length
#   call leading_substrings a number of times
# store results in array
# reutrn array

def substrings(string)
  start = 0
  result = []
  string.length.times do
    result.push(leading_substrings(string, start))
    start += 1
  end
  result.flatten
end
# p substrings('abcde')


#   Problem 5   Had one small bug, but managed to identify and implement a quick fix

# Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of
# the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings
# appear in the string. Duplicate palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous exercise.

# For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome,
# but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

# i : string
# o : array of string palindromes

# algo

# input string
# call substrings
# assign to var
# assign result to var w/ select method
# pass block re: reverse
# return result


def palindromes(string)
  result = []
  all_subs = substrings(string)
  result = all_subs.select do |el|
    el == el.reverse && el.length > 1
  end
  result
end
# p palindromes('madam') #== ['madam', 'ada']
# p palindromes('hello-madam-did-madam-goodbye')


#   Problem 6

# Write a method that takes two arguments: the first is the starting number, and the second is the ending number.
# Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz",
# if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

def fizzbuzz(start, finish)
  start.upto(finish) do |num|
    puts "Fizz" if (num%3).zero?
    puts "Buzz" if (num%5).zero?
    puts "FizzBuzz" if (num%3).zero? && (num%5).zero?
    puts num
  end
end

# fizzbuzz(1, 15)

#   Problem 7   Solved in under 5 minutes, including pedac process and code implementation

# Write a method that takes a string, and returns a new string in which every character is doubled.

# p   i: string, o: ssttrriinngg
# e   moot
# d   array, strings
# a
#     split input
#     initialize empty array
#     traverse split input with map method
#     transform elements by appending them to self
#     return joined array
# c
def repeated(string)
  arr = string.split('')
  result = arr.map do |el|
    el *= 2
  end
  result.join
end

# p repeated('joel')
# p repeated('')

#   Problem 8 Under 7, kind of struggled to generate alphabet sans vowels

# Write a method that takes a string, and returns a new string in which every consonant character is doubled.
# Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

def repeated(string)
  alp_sans_vowels = ('a'..'z').to_a.select do |char|
    !%w(a e i o u).include?(char)
  end

  arr = string.split('')
  result = arr.map do |el|
    alp_sans_vowels.include?(el.downcase) ? el *= 2 : el
  end

  result.join
end

# p repeated('JoEl@@@')

#     Problem 9    finished in 3 minutes

# Write a method that takes a positive integer as an argument and returns that number with its digits reversed. Examples:

def reversed_number(integer)
  integer.to_s.split("").reverse.join.to_i
end

# p reversed_number(12345) #== 54321
# p reversed_number(12213) #== 31221
# p reversed_number(456)# == 654
# p reversed_number(12000) #== 21 # No leading zeros in return value!
# p reversed_number(12003) #== 30021
# p reversed_number(1) #== 1

#   Problem 10  took a little longer than 7 minutes, my mistakes: assigned result to nil instead of [], forgot to divide string.size by 2 in slice calculation.

# Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument.
# If the argument has an odd length, you should return exactly one character. If the argument has an even length, you should return exactly two characters.


# odd

def center_of(string, result = [])
  arr = string.split('')

  if arr.size.odd?
    result << arr.slice((string.size/2), 1)
  else
  result << arr.slice((string.size/2) - 1, 2)
  end
  result.join
end

# p center_of("josdfsadf asdfasdf asdf elb")
# sjdjfjs