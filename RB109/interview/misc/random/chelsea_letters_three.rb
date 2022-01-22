=begin



['fhjgkiiidldddaaavvv', 'fdsaiiimnvsvv', 'aaaghfkdiiivvv'] ==> [i,v]
put into a separate array all letters that are seen 3 times 


Problem: 

i: array of words
o: array of letters that are seen exactly three times in each word.

rules
  -> we dont care if they are consecutive
  -> only that they occur exactly 3 times in every word


ds: array -> upon each -> tally letter counts (hash)-> array of 3count letters


algo:

traverse input array (map)
INIT empty arr
get all letter counts for each element (word)

based on these hashs -> select keys whose value is exactly 3

  -> check if all have these letters -> choose only those that are shared amongst the three groups


use the first array of keys

for each element in first keys array
  check if that key is included in each of the other arrays

=end

def method(array)
  counts_arr = array.map { |str| str.chars.tally }

  counts_arr = counts_arr.map do |hsh|
    hsh.select {|key, value| key if value.eql?(3)}
  end
  
  #grab the keys from counts_arr which are included in all of the hash objects
  arr_of_keys = counts_arr.map(&:keys)
  #  arr_of_keys.select {|x| arr_of_keys.count(x) ==3}.uniq 
  doors = arr_of_keys.first
  
  result = doors.select do |key|
    arr_of_keys.all? {|sub_arr| sub_arr.include?(key)}
  end
  result
end
# [['a','i','v'],['i','v']].flatten
# 

p method(['fhjgkiiidldddaaavvv', 'fdsaiiimnvsvv', 'aaaghfkdiiivvv']) #== [i,v]

