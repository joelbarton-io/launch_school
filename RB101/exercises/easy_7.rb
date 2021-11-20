#   Problem 1

# Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements
# from both Array arguments, with the elements taken in alternation.
# You may assume that both input Arrays are non-empty, and that they have the same number of elements.

# PEDAC?

# algo

# arr.size number of times, do
# on each supplied array, push el at index to new array
# return the array

def interleave(arr1, arr2)
  inter_woven = []
  count = 0
  arr1.size.times do
    inter_woven << [arr1[count], arr2[count]]
    count += 1
  end
  inter_woven.flatten
end
# p interleave([1, 2, 3], ['a', 'b', 'c'])

#   Problem 2

# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters
# in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.

# PEDAC?
def alpha?(letter)
  alphas = ('a'..'z').to_a + ('A'..'Z').to_a
  alphas.include?(letter)
end

def letter_case_count(string)
  hash = { :lower => 0, :upper => 0, :neither => 0 }

  string.split("").each do |letter|
    if alpha?(letter)
      hash[:upper] += 1 if letter == letter.upcase
      hash[:lower] += 1 if letter == letter.downcase
    else
      hash[:neither] += 1
    end
  end
  hash
end
# p letter_case_count('abCdef 123')


#   Problem 3

# Write a method that takes a single String argument and returns a new string that contains the original value of the argument
# with the first character of every word capitalized and all other letters lowercase.
# You may assume that words are any sequence of non-blank characters.

# PEDAC?

# convert string to an array
# transform the array using collection
# each tiem the block is invoked on an element of our array, we will...
# make all letters downcase then capitalize first letter

def word_cap(words)
  new_array = words.split(' ').collect do |word|
    word.downcase.capitalize
  end
  new_array.join(' ')
end
# p word_cap("joel barton is learning to code")


#   Problem 4

# Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its
# lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.
# You may not use String#swapcase; write your own version of this method.

# PEDAC?

def swap_them(string)
  final = string.split(' ').map do |word|
    new_one = word.split('').map do |letter|
      if alpha?(letter)
        if letter == letter.downcase
          letter.upcase
        elsif letter == letter.upcase
          letter.downcase
        end
      else
        letter
      end
    end
    new_one.join('')
  end
  final.join(' ')
end
# p swap_them("joel is CODING")


#   Problem 5

# Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered
# capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that
# are not letters should not be changed, but count as characters when switching between upper and lowercase.

# PEDAC?

def staggered_case(string, start_at_first = true)
  start_at_first ? count = 0 : count = 1
  array = string.split('')

  until count == array.length - 1 do
    if count.odd?
      array[count].downcase!
    else
      array[count].upcase!
    end
    count += 1
  end
  array.join
end

#   Problem 6   ****

# Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or
# lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.


# basically, everything we encounter a real letter, we need to flick a switch
# if we aren't looking at a real letter, we dont flick the switch and just go next


def staggered_case(string)
  switch = true
  array = string.split('')
  array.each do |letter|
    if alpha?(letter)
      if switch
        letter.upcase!
      else
        letter.downcase!
      end
      switch = !switch
    else
      letter
    end
  end
  array.join
end

# corrupted_name = staggered_case("Jo------e+++l-234 B1a4ro#tn")

# clean_name = corrupted_name.split('').select do |element|
#   alpha?(element)
# end
# p clean_name.join

# PEDAC?


#   Problem 7

# Write a method that takes an Array of integers as input, multiplies all the numbers together, divides the result by the number of entries in the Array, and then
# prints the result rounded to 3 decimal places. Assume the array is non-empty.

# PEDAC?

# Two variables, length and product
# get the product of all array elements multiplied
# rounding to 3 decimals %0.3f

def show_multiplicative_average(array)
  count = array.count
  product = array.inject(:*)
  result = product/count
  outcome = "%0.3f" % [result]
end

# p show_multiplicative_average([1,2,3,4,5,6])

#   Problem 8

# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product
# of each pair of numbers from the arguments that have the same index. You may assume that the arguments contain the same number of elements.

# PEDAC?

#   this is HUGE!!

def multiply_list(arr1, arr2)
  multiplied = arr1.map.with_index do |el, index|
    el * arr2[index]
  end
  multiplied
end

# p multiply_list([3, 5, 7], [9, 10, 11])

#   Problem 9

# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of every pair of numbers
# that can be formed between the elements of the two Arrays. The results should be sorted by increasing value.
# You may assume that neither argument is an empty Array.


def multiply_all_pairs(arr1, arr2)

  outcome = arr1.map do |el|
    arr2.map do |el2|
      el2 * el
    end
  end.flatten.sort
  outcome
end
# p multiply_all_pairs([2, 4], [4, 3, 1, 2])

#   Problem 10

# Write a method that returns the next to last word in the String passed to it as an argument.
# Words are any sequence of non-blank characters.
# You may assume that the input String will always contain at least two words.

# PEDAC?

def pen_ultimate(string)
  string[-2]
end

# or

def pen_ultimate(string)
  string.split(" ").fetch(-2)
end

# p pen_ultimate("hoel jsj ksj j jdjjsj!")