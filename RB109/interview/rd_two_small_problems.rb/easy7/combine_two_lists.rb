=begin

i: two non-empty arrays with same size
o: new array, with input elements interleaved

elements from the first input array comes first in new array

algo:

init cache
iterate input array length *2
based on current iteration number, choose from either arr1 or array 2
  evens will be arr1, odds -> arr2
  push element to new array
complete iteration

return new array
=end

def interleave(arr1, arr2)
  cache = []
  arr1.each.with_index do |el, idx|
    cache << el
    cache << arr2.fetch(idx)
  end
  cache
end

p interleave([1, 2, 3], ['a', 'b', 'c'])
# time to completion: 12:30.  My initial decision to use the .times method led to
# over-complication.  Using .each and .with_index allowed me to keep track of the 
# current idx as well as the ability to access the respective elements in both arrs.