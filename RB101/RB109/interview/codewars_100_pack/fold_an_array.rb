=begin

considerations:
  -> if arr length == 1, arr stays the same
  -> if curr arr length is odd, the 'middle' or pivot, always defaults to the left
  -> runs will always be a positive integer > 0
  -> arr is always filled w integers
  
i: arr, int
o: condensed array 
  
ex. runs   = 1
  input    = [ -9, 9, -8, 8, 66, 23 ]
  expected = [ 14, 75, 0 ]
  
ds: arrs

algo:

GUARD for input arr length 1
CLONE input arr

runs times do 
  GET arr length
  IF arr_leng is odd?
    INIT front_half to arr.slice!(0..(length/2))  -> destructive
    REVERSE mutated arr

    TRAVERSE mutated arr indices
      add curr integer element to respective arr element in front half
  REASSIGN cloned arr = this result
  IF arr_length is even?
    INIT front_half to arr.slice!(0...(length/2)) -> destructive
    reverse mutated arr
    
RETURN resulting array

=end
def fold_array(array, runs)
  return array if array.size.eql?(1)
  cloned = array.clone
  runs.times do 
    cloned = helper(cloned)
  end
  cloned
end

def helper(arr)
  leng = arr.size
  offset = leng.even? ? 1 : 0
  front_half = arr.slice!(0..((leng-offset)/2))

  arr = arr.reverse
  (0...arr.size).each {|idx| front_half[idx] += arr[idx] }
  front_half
end