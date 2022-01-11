=begin
i: array      o: array      (dont mutate original object)

ds: arr -> cloned arr -> |rotation operation| -> new_arr

algo:

INIT cloned array from input
shift and push first to last
RETURN modified clone arr object
=end

def rotate_array(array)
  dup_arr = array.clone

  dup_arr.push(dup_arr.shift)
  dup_arr
end



p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true
