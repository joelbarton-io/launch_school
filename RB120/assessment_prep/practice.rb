
# brushing off the cobwebs
=begin
Given an array of integers of any length, return an array that has 1 added to
the value represented by the array.

the array can't be empty
only non-negative, single digit integers are allowed
Return nil (or your language's equivalent) for invalid arrays.

Examples
For example the array [2, 3, 9] equals 239, adding one would return the array [2, 4, 0].

i: array of ints of any length
o: array of digits that represents the array as a number plus 1

algo:

if any elements are negative, then return nil
if array empty, nil

Guard clause ^
Join elements into a string
Convert said string to integer
Add 1 to this number
Conver integer to string
Convert string to array and return

ds

arr -> str -> integer -> str -> arr
=end
# [4, 3, 2, 5] would return [4, 3, 2, 6]

def up_array(array)
  return nil if array.empty? || array.any? { |el| el < 0 }
  arr_as_int = array.join("").to_i
  arr_as_int += 1
  arr_as_int.digits.reverse
end
p up_array([2,3,9]) == [2,4,0]
p up_array([4,3,2,5]) == [4,3,2,6]
p up_array([1,-9]) == nil
