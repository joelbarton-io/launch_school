#   EASY 6
#   Problem 1
# DEGREE = "\xC2\xB0"
def dms(value)

  degrees = value.to_i
  minutes = ((value - degrees)* 60).to_i
  seconds = ((((value - degrees) * 60) - minutes) * 60).to_i

  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

# p dms(76.73)
# p dms(93.034773)


#   Problem 2
def remove_vowels(array)
  vowels = %w(a e i o u A E I O U)
  array.map do |el|
    el.split('').select { |letter| !vowels.include?(letter) }.join
  end
end

# secondary
def remove_vowels(array)
  array.map do |string_el|
    string_el.gsub(/[aeiou]/i, '')
  end
end
# p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz))
# p remove_vowels(%w(ABC AEIOU XYZ))

# stumbling blocks with this problem:
#   1) using map for the outer method solves the issue of multiple elements bc it is guarunteed
#      to return an array with the same number of elements as the calling object.
#   2) the other issue was struggling to recognize that I couldn't apply .select/.reject on
#      string objects


#   Problem 3
# i: length l of a fibonacci number (integer)
# o: the index of the first occurence of number with length l

# initialize two variables to zero and 1
# start loop

# indexer to keep track of current_num index
# increment indexer
# reassign current_num

# seed variables, index
# enter loop

# initialize value @ current index
# increment index tracker

# exit condition `break` returns current index while breaking out of loop...do

# reassign seed values
# reassign current value to their sum

def find_fibonacci_index_by_length(leng)
  seed_a = 1
  seed_b = 1
  index = 2

  loop do
    current_num = seed_a + seed_b
    index += 1

    break index if current_num.to_s.split('').size == leng

    seed_a = seed_b
    seed_b = current_num
    current_num = seed_a + seed_b
  end
end


#   Problem 4 (Under 5)
# Write a method that takes an Array as an argument, and reverses its elements in place;
# that is, mutate the Array passed into this method. The return value should be the same Array object.

list = [1,2,3,4]
def reverse(arr)
  time = arr.size
  temp = []
  time.times do
    temp << arr.pop
  end
  temp.each do |el|
    arr.push(el)
  end
  arr
end


#   Problem 5 (UNDER 5)
# return a new Array with the elements of the original list in reverse order.
# Do not modify the original list.

# p list.object_id
def new_reverse(arr)
  index = arr.size - 1
  new_one = []

  while index >= 0 do
    new_one.push(arr[index])
    index -= 1
  end
  new_one
end
# p new_reverse(list).object_id


#   Problem 6 (Under 5)
# Write a method that takes two Arrays as arguments, and returns an Array that contains
# all of the values from the argument Arrays. There should be no duplication of values in
# the returned Array, even if there are duplicates in the original Arrays.

#   ex:  merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

def merge(arr1, arr2)
  arr1.concat(arr2).uniq!
end
# p merge([1, 3, 5], [3, 6, 9])


#   Problem 7 (under 5)
# Write a method that takes an Array as an argument, and returns two Arrays (as a pair of nested Arrays)
# that contain the first half and second half of the original Array, respectively. If the original array
# contains an odd number of elements, the middle element should be placed in the first half Array.

#   ex:   halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]

def halvsies(arr)
  if arr.size.even?
    first = arr.slice(0, (arr.size)/2)
    second = arr.slice((arr.size)/2, arr.size)

  elsif arr.size.odd?
    first = arr.slice(0, ((arr.size/2) + 1))
    second = arr.slice((arr.size/2) + 1, arr.size)

  end
  [first, second]
end
# p halvsies([1, 2, 3, 4, 5])
# p halvsies([1])


#   Problem 8 ( solved in 3:30 )
# Given an unordered array and the information that exactly one value in the array occurs twice
# (every other value occurs exactly once), how would you determine which value occurs twice? Write a method that
#  will find and return the duplicate value that is known to be in the array.

def find_dup(array)
  sorted = array.sort do |a, b|
    a <=> b
  end
  count = 0
  while sorted.size > count do
    break dup = sorted[count] if sorted[count] == sorted[count + 1]
    count += 1
  end
  dup
end


#   Problem 9 (solved in 1:20)
# Write a method named include? that takes an Array and a search value as arguments. This method should return true
#  if the search value is in the array, false if it is not. You may not use the Array#include? method in your solution.

def include?(array, s_value)
  answer = false
  array.each do |el|
    answer = true if el == s_value
  end
  answer
end

# p include?([1,2,3,4,5], 3) #== true
# p include?([1,2,3,4,5], 6) # == false
# p include?([], 3) #== false
# p include?([nil], nil) # == true
# p include?([], nil) # == false


#   Problem 10 DNF under 5, under 10 tho....
# Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars.
# The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and
# the other end at the upper-right.

def triangle(n)
  space = ' '
  star = '*'
  number_of_spaces =* 0..n-1

  number_of_spaces.reverse!.each do |el|
    line = ''
    el.times do
      line << space
    end
    (n - el).times do
      line << star
    end
    puts line
  end
end

# triangle(69)
