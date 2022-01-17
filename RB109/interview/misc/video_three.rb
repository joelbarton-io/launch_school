=begin

the maximum sum subarray problem consists of finding the maximum sum of a contiguous subsequence in an array of integers:

max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6

Easy case is when the array is made up of only positive numbers and the maximum sum is the sum of the whole array. If the array is made up of only negative numbers, return 0 instead.

Empty array is considered to have zero greatest sum. Note that the empty array is also a valid sub_array.

i: arr (either filled with +/- integers, or emty)
o: integer value (max_sum)

goal: get max sum of consecutive integers from an array

requirements:

-> if the input is empty                 -> return 0
-> if all elements in input are positive -> get full sum
-> if all elements are negative          -> return 0

ds: arr_of_ints -> pass_guards? -> |op, get all cons sums| -> int (get max sum)

algo:

GUARD clauses
  -> if the input is empty                 -> return 0
  -> if all elements in input are positive -> get sum of full array
  -> if all elements are negative          -> return 0
  
GENERATE cons_sums from the input array -> helper method here
  TRAVERSE from first to last to generate all cons sums (nested range looping)

GET max from the resulting array cons_sums
RETURN this ^ number
=end
def get_cons_integer_sums(arr)
  cache = []
  arr_leng = arr.size
  (0...arr_leng).each do |start_idx|
    (start_idx...arr_leng).each do |end_idx|
      cache << arr[start_idx..end_idx]
    end
  end
  cache.map(&:sum)
end


def max_sequence(input)
  return 0 if input.empty? || input.all? {|num| num < 0}
  return input.sum if input.all? {|num| num >= 0}
  
  cons_integer_sums = get_cons_integer_sums(input)
  cons_integer_sums.max
end


p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12

# time: 18 again, had some stumbling with my sub_arrays helper method