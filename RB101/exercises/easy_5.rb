# Easy 5



# Problem 1

# def ascii_value(string)
#   result = 0
#   string.each_char do |el|
#     result += el.ord
#   end
#   result
# end

# p ascii_value('Four score')



# Problem 2

# rules:
  # if number +, time is after midnight
  # if number -, time is before midnight

# i: positive or negative integer value
# o: string object formatted like "hh:mm"

# - if abs(number) > MINUTES_IN_DAY
#   loop until number <= MINUTES_IN_DAY
#     number -= MINUTES_IN_DAY
#

# - establish if it is positive or negative...
#   - if negative, number time + 12:00 == result
#   - if positive, number time == result

# - hours var
# - minutes var

# loop until number is less than or equal to ONE_HOUR
#   each iteration, subtract ONE_HOUR, increment hours
# end

# number remainder will be our minutes element :mm
# then we just need to put them together with the correct formatting.



#   I didn't feel like dealing with negative time and
#   decided to write a method to convert negative values to
#   their positive counterparts (-3) -> (1437)

#   another thing that needed to happen was to deal with inputs
#   that exceeded the total_minutes minutes in a day


# MINUTES_IN_DAY = 1440
# ONE_HOUR = 60

# def usable_number(num)            # deals with numbers that exceed the total_minutes amount
#   until num < MINUTES_IN_DAY      # of minutes in a 24 hour period
#     num -= MINUTES_IN_DAY
#   end
#   num
# end

# def convert_number(num)
#   hours = 0
#   minutes = 0
#   output = []

#   until num < ONE_HOUR
#     hours += 1
#     num -= ONE_HOUR
#   end

#   hours = 0 if hours == 24
#   output.push(hours.to_s, ':', num.to_s)
#   output
# end

# def time_of_day(number)

#   number_is_negative = number < 0

#   if number.abs > MINUTES_IN_DAY
#     number = usable_number(number.abs)
#   end

#   if number_is_negative
#     positive_number =  MINUTES_IN_DAY - number
#   else
#     positive_number = number
#   end

#   time_array = convert_number(positive_number)

#   time_array.first.prepend('0') if time_array.first.length < 2
#   time_array.last.prepend('0') if time_array.last.length < 2

#   time_array.join
# end



# Problem 3

# writing two methods after_midnight, and before_midnight

# for each:
  # i: string representation of time
  # o: integer that conveys the absolute(number) of minutes to midnight

# rules:
  # 1) return value will be 0..1439
  # 2) will need an edge catcher for when input is 24:00

# def before_midnight(clock_24)

#   hours = clock_24.slice(0,2).to_i
#   minutes = clock_24.slice(3, 2).to_i
#   total_minutes = (hours*60) - minutes

#   if total_minutes == MINUTES_IN_DAY
#     total_minutes -=  MINUTES_IN_DAY
#   else
#     total_minutes
#   end
# end

# MINUTES_IN_DAY = 1440

# def after_midnight(clock_24)

#   hours = clock_24.slice(0,2).to_i
#   minutes = clock_24.slice(3, 2).to_i
#   total_minutes = (hours*60) + minutes

#   total_minutes == MINUTES_IN_DAY ? total_minutes -=  MINUTES_IN_DAY : total_minutes
# end

# def before_midnight(clock_24)

#   hours = clock_24.slice(0,2).to_i
#   minutes = clock_24.slice(3, 2).to_i
#   total_minutes = (hours*60) - minutes

#   total_minutes == MINUTES_IN_DAY ? total_minutes -=  MINUTES_IN_DAY : total_minutes
# end

# def minutes_relative_midnight(clock_24, relative)
#   hours = clock_24.slice(0,2).to_i
#   minutes = clock_24.slice(3, 2).to_i

#   case relative
#   when 'before'
#     total_minutes = (hours*60) - minutes
#   when 'after'
#     total_minutes = (hours*60) + minutes
#   end

#   (total_minutes == MINUTES_IN_DAY) ? total_minutes -=  MINUTES_IN_DAY : total_minutes
# end

# p minutes_relative_midnight('12:34', 'after')

# MINUTES_IN_DAY = 1440

# def after_midnight(clock_24)

#   hours = clock_24.slice(0,2).to_i
#   minutes = clock_24.slice(3, 2).to_i
#   total_minutes = (hours*60) + minutes

#   total_minutes == MINUTES_IN_DAY ? total_minutes -=  MINUTES_IN_DAY : total_minutes
# end

# def before_midnight(clock_24)

#   hours = clock_24.slice(0,2).to_i
#   minutes = clock_24.slice(3, 2).to_i
#   total_minutes = (hours*60) - minutes

#   total_minutes == MINUTES_IN_DAY ? total_minutes -=  MINUTES_IN_DAY : total_minutes
# end
# ```
# So I noticed that only difference between my methods is the +/- when calculating the totals on lines 7 and 16 so I wrote a method that accepts a second string argument 'relative' where we specify before or after midnight.
# ``` ruby
# def minutes_relative_midnight(clock_24, relative)
#   hours = clock_24.slice(0,2).to_i
#   minutes = clock_24.slice(3, 2).to_i

#   case relative
#   when 'before'
#     total_minutes = (hours*60) - minutes
#   when 'after'
#     total_minutes = (hours*60) + minutes
#   end

#   (total_minutes == MINUTES_IN_DAY) ? total_minutes -=  MINUTES_IN_DAY : total_minutes
# end

# p minutes_relative_midnight('12:34', 'after')




# Problem 4

# Given a string of words separated by spaces, write a method that takes this string of words
# and returns a string in which the first and last letters of every word are swapped.

# You may assume that every word contains at least one letter, and that the string will always
# contain at least one word. You may also assume that each string contains nothing but words and spaces.

# EX:
# swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# swap('Abcde') == 'ebcdA'
# swap('a') == 'a'

# i: string
# o: string with flipped element


# rules:

# 1) if original arg.length is == 1, just return that

# 2) if array element.length == 1, can just pass that back

# Algo

# if original arg.length is == 1, just return that

# need a loop to traverse array elements
# each iteration should check length of element, if that number is == 1, next
# if length > 1
#   first = el.slice(0)
#   last = el.slice(el.length-1)
#   el.prepend last
#   el << first
# end
# return array.join(',')

# def swap(sentence)
#   return sentence if sentence.length == 1
#   words = sentence.split
#   new_words = Array.new

#   words.each do |el|
#     if el.length == 1
#       new_word.push(el)
#       next
#     end

#     first = el.slice!(0)
#     last = el.slice!(el.length - 1)
#     el.prepend(last)
#     el.concat(first)

#     new_words.push(el)
#   end
#   new_words.join(' ')
# end

# p swap("General Kenobi")




# Problem 5

# Prompt:

#   Given a string that consists of some words (all lowercased) and an
#   assortment of non-alphabetic characters, write a method that returns
#   that string with all of the non-alphabetic characters replaced by spaces.
#   If one or more non-alphabetic characters occur in a row, you should only
#   have one space in the result (the result should never have consecutive spaces).


#   something to figure out: use .compact, which means we need to tell the program
#   to transform non alpha numerics to nil  great op to use .map

#   Also, will be using regex ?

# def clean_up(dirty_string)
#   clean_string = dirty_string.gsub(/[^a-z ]/i, ' ').gsub(/\s+/, " ")
# end

# def clean_up dirty_string
#   dirty_string.gsub(/[^a-z\s]/, ' ').squeeze
# end

# p clean_up('#asdf%%,0w@')






# Problem 6

# Prompt:

#   Write a method that takes a string with one or more space separated words
#   and returns a hash that shows the number of words of different sizes.
#   Words consist of any string of characters that do not include a space.


# i: string
# o: hash,
#    keys are # of letters in word
#    values are # of occurences of that length of word

# Algo

# - split word into array of words

# - initialize hash

# - iterate over words_arr using each
#   - for each word,
#     - if key does not exist in hash,
#       hash[word.length] = 1
#     - key does exist
#       hash[word.length] += 1
# return hash

# Initial solution

# def word_sizes(sentence)
#   hash = Hash.new
#   sentence.split.each do |el|
#     if !hash.include?(el.size)
#       hash[el.size] = 1
#     else
#       hash[el.size] += 1
#     end
#   end
#   hash.sort.to_h
# end

# Solution with each_with_object method

# def word_sizes(sentence)
#   initial = sentence.split

#   output = initial.each_with_object({}) do |(length, occurence), hash|
#     next hash[length.size] = 1 if !hash.include?(length.size)
#     hash[length.size] += 1
#   end

#   output.sort.to_h          # these last two method invocations are unnecessary,
# end                         # i just wanted my output to match LS's

# p word_sizes 'Four score and seven.'




# Problem 7

# combined problems 6 and 5

# def word_sizes(sentence)
#   initial = sentence.split

#   initial.map! { |el| el.gsub(/[^a-z ]/i, '') }

#   output = initial.each_with_object({}) do |(length, occurence), hash|
#     next hash[length.size] = 1 if !hash.include?(length.size)
#     hash[length.size] += 1
#   end

#   output.sort.to_h
# end
# p word_sizes('Hey diddle diddle, the cat and the fiddle!')




# Problem 8

# So.  This solution is a bit silly as it doesn't actually use input: `ints`. Since the necessary information for the output hash's value is accessible by using the .index method on `words` , I opted to do that but have included an inclusive way as well 👍

# def alphabetic_number_sort(ints)
#   words = %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
#                                 # index = 0
#   output = words.each_with_object({}) do |el, hash|
#     hash[el] = words.index(el)  # sub 'words.index(el)' for ints[index]
#                                 # then increment index by 1 on this line
#   end
#   output.sort.to_h.values
# end

# p alphabetic_number_sort((0..19).to_a)



# Problem 9

# rules
#     preserves spaces
#     no squeeze/!
#     should be destructive

# algo
#     to array
#     if array.size == 1 return join
#     each do

# def crunch(string)
#   return string if string.size == 1
#   arr = string.split('')
#   singles = [arr.shift]

#   arr.each do |el|
#     curr = singles.last
#     next if curr == el
#     singles.push(el)
#   end

#   singles.join
# end

# p crunch('ddaaiillyy ddoouubbllee')

# problem 10

# def print_in_box(string)
#   string = string[0..76]
#   outer_line = "+-#{'-' * string.size}-+"
#   inner_line = "| #{' ' * string.size} |"

#   puts outer_line
#   puts inner_line
#   puts "| #{string} |"
#   puts inner_line
#   puts outer_line
# end

# print_in_box('hello there')