=begin
i: array of integers    o: integer (idx)

considerations:
      -> empty arrays sum to zero in this problem
      -> the idx that we return is not included in either summing operation
      -> N is the index we are cutting from

Ex.
arr = [1, 2, 3, 4, 3, 2, 1]
p arr[0...curr_idx].sum
p arr[curr_idx+1..].sum

ds: arr -> int (idx)

algo:

TRAVERSE input indices (using a range).each
COMPARE left/right sums
  -> if eql? -> return curr idx
  -> else, go next
FINISHED
=end

def find_even_index(array)
  (0...array.size).each do |idx|
    sum_left = array[0...idx].sum
    sum_right = array[(idx+1)..].sum
    return idx if sum_left.eql?(sum_right)
  end
  -1
end

p find_even_index([1, 2, 3, 4, 3, 2, 1])
p find_even_index([1, 100, 50, -51, 1, 1])
p find_even_index([1, 2, 3, 4, 5, 6])
p find_even_index([20, 10, 30, 10, 10, 15, 35])
p find_even_index([20, 10, -80, 10, 10, 15, 35])
p find_even_index([10, -80, 10, 10, 15, 35, 20])
p find_even_index([-1, -2, -3, -4, -3, -2, -1])
# time: 15 minutes