=begin
FUNCTION:
  -> accepts two integer arrays of equal length
  -> compares the value each member in one array to the corresponding member in the other
  -> squares the absolute value difference between those two values
  -> and returns the average of those squared absolute value difference between each member pair.

EX:
[1, 2, 3], [4, 5, 6]              -->   9   because (9 + 9 + 9) / 3
[10, 20, 10, 2], [10, 25, 5, -2]  -->  16.5 because (0 + 25 + 25 + 16) / 4
[-1, 0], [0, -1]                  -->   1   because (1 + 1) / 2


i: two arr      o: int

'cooresponding'        -> same relative index -> we are pairing up elements by relative index
'absolute value diff ' -> (-2 - 5) -> 7 
'squared'              -> 7 ** 2   -> 49

ds: arrs -> integer

algo:
INIT cache arr
TRAVERSE one array with indices
  ACCESS pair of elements 
  GET absolute value diff -> PUSH this value ** 2 into CACHE arr
FINISH
SUM of elements in cache / cache length

=end
def solution (arr1, arr2)
  cache = []
  arr1.each.with_index do |num, idx|
    cache << ((num - arr2[idx]).abs ** 2)
  end
  cache.sum.to_f/arr2.size
end

# p solution([1, 2, 3], [4, 5, 6]) == 9
p solution([10, 20, 10, 2], [10, 25, 5, -2]) == 16.5
# p solution([-1, 0], [0, -1]) == 1

# finished in 14 minutes, felt very solid throughout -> one hiccup: the float issue