# Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.
array = ['a', 'b', 'c']

array.slice(1, array.size) << array.first

string = 'hi hello there'

new_string = string.chars.rotate(3).join

p new_string