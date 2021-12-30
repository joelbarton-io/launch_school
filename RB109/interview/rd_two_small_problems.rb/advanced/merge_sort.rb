=begin

i: two sorted arrays
o: combined, new_array; sorted

considerations:
- one element at a time
- input arrays can be of diff lengths
- arrays can be empty

ex: merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
ds: arrays

ALGO:
return other array if either array is empty
need two separate idx values for each array
if we get to end of one array,then just slice other array from curr idx to new array

iterate sum of array lengths times
- everytime an element is pushed to new array, this constitutes an iteration
- compare curr el of one with other
  - if curr1 is pushed, increment curr1's arr idx counter

return new_array, with sorted elements from args

=end

def merge(arr1, arr2)
  return arr2 if arr1.empty?
  return arr1 if arr2.empty?
  new_array = []
  iterations = arr1.size + arr2.size
  idx1 = 0
  idx2 = 0

  iterations.times do
    if arr1[idx1].eql?(nil)
      new_array << arr2[idx2..]
      break
    elsif arr2[idx2].eql?(nil)
      new_array << arr1[idx1..]
      break
    else
      if arr1[idx1] > arr2[idx2]
        new_array << arr1[idx1]
        idx1 += 1
      elsif arr1[idx1] < arr2[idx2]
        new_array << arr2[idx2]
        idx2 += 1
      else 
        new_array << arr1[idx1] << arr2[idx2]
        idx1 += 1
        idx2 += 1
      end
    end
  end
  p new_array.flatten
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]