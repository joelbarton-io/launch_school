

=begin

Write a method to find the longest common prefix string amongst an array of strings. 
If there is no common prefix, return an empty string ''.

ex:

in: ['flower', 'flow', 'flight']
out: 'fl'

ex:

in: ['dog', 'racecar', 'car']
out:  ''

no common prefix


rules:
  -> common prefix (shared letters must be starting from index 0)
  -> case doesn't affect thing for this problem, disregard
  
i: array of words
o: the common prefix amongst array elements

goal: find the longest shared prefix if there is one. otherwise, return an empty string

ds: arr -> str_prefix


algo:

stores a prefix string while we traverse the indices of all elements

GET length of shortest word, use that as our far bound for a range -> store in variable
  -> traversing indices -> allows us access to all elements and same index
  INIT prefix variable to empty
  
  
  
helper get each first -> make uniq from all firsts -> if that length is > 1, 
-> if they're all the same
  -> add this shared letter to prefix string
-> not all same?
   -> returning prefix string as it is
--
=end

def common_prefix(array)
  shortest = array.min_by(&:size).size
  shared_prefix = ''
  
  (0...shortest).each do |idx|
    curr_chars_arr = array.map {|word| word[idx]}
    return shared_prefix if curr_chars_arr.uniq.size > 1 # if they are not the same
    shared_prefix << array.first[idx]
  end 
  shared_prefix
end


p common_prefix(['flower','flow','flight']) == 'fl'
p common_prefix(['dog','racecar','car']) == ''
p common_prefix(['intersteller','interspecies','interstate']) == 'inters'
p common_prefix(['throne', 'dungeon']) == ''
p common_prefix(['throne', 'throne']) == 'throne'
