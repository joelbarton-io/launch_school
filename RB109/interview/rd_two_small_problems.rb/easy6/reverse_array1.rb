=begin
Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. The return value should be the same Array object.

You may not use Array#reverse or Array#reverse!.

i: arr       o: -> same_arr with elements reversed

REQ: 
can't use `reverse` or `reverse!`
must be same array object (i.obj_id == o.obj_id)

ds: arr -> same_arr object


Examples:

Copy Code
list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1] # true
list == [4, 3, 2, 1] # true
list.object_id == result.object_id # true

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"] # true
list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
reverse!(list) == ["abc"] # true
list == ["abc"] # true

list = []
reverse!(list) == [] # true
list == [] # true


high level approach:

  remove all the elements in the input array

  replace all elements in the reverse order

  return input array object


low level implem: 
  
  If input size == 1, return input
  
  INIT cache
  
  until input array empty?
    remove element and push into cache
  completed?
  
  until cache empty?
    push cache's elements into original array object (reverse order)
  completed?
  
  return original, reversed array object

=end
def reverse!(list)
  return list if list.size.eql?(1)
  
  cache = []
  
  until list.empty? do
    cache << list.pop
  end
  
  until cache.empty? do
    list << cache.shift
  end
  list
end


p list = [1,2,3,4]
p result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true
p list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true
p list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true
p list = []
p reverse!(list) == [] # true
p list == [] # true