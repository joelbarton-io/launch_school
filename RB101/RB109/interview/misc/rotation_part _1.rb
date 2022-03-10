=begin
write a method that rotates an array by moving the first element to the end of the array. 
Do not modify the original array

i: arr
o: same_arr with first element now last

rules: 
  -> no mutation
  -> no rotate or rotate! methods

problem: move the first element to the end of the input array without mutating the arr object

ds: arr -> |op| -> rra 

algo:

SHIFT out first element of input array -> assign to temporary variable
PUSH in the value referenced by temporary variable into input array

=end

def rotate(array)
  return array if array.empty?  
  temp = array.shift 
  array << temp
  array
end

p rotate([1, 2, 3])
p rotate([4, 2, 3])
p rotate([1, 2, 6])
p rotate(['a', 's'])
p rotate([])