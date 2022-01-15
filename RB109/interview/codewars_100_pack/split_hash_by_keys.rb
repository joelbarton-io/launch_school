=begin
i: hash, split-by :keys
o: array of hashes

considerations:
  -> need to remove empty hash if present in output array
  -> if any of the secondary args are not included in arg 1, raise exception
  -> if the secondary arg type doesn't match primary arg type key, raise exception

ds: hash -> arr_of_key-value_pairs -> |operation| -> |check| -> arr

algo: 
CONVERT hash -> arr of key-value pairings
TRAVERSE arr of sub_arrs, split when sub[0] equal to any of our secondary args
CONVERT sub_arrs back into hash objects, map w/ to_h
REMOVE any empty hashes
RETURN arr of hashes
=end
def split_hash_by_key(hash, *args)
  arr_of_pairs = hash.to_a
  return 'invalid' if args.first.class != hash.keys.first.class
  result = arr_of_pairs.slice_before do |key_val_pair|
    args.include?(key_val_pair.first)
  end.map(&:to_h)
  result.select {|cand| !cand.empty?}
end
p split_hash_by_key( { :a=>1, :b=>2, :c=>3, :d=>4, :e=>5, :f=>6 }, :c, :e ) # returns [ {:a=>1, :b=>2}, {:c=>3, :d=>4}, {:e=>5, :f=>6} ]
p split_hash_by_key( { :a=>1, :b=>2, :c=>3, :d=>4, :e=>5, :f=>6 }, :b, :f ) # returns [ {:a=>1}, {:b=>2, :c=>3, :d=>4, :e=>5}, {:f=>6} ]
# p split_hash_by_key( { 'a'=>1, 'b'=>2, 'c'=>3, 'd'=>4, 'e'=>5, 'f'=>6 }, 'd' ) # returns [ {"a"=>1, "b"=>2, "c"=>3}, {"d"=>4, "e"=>5, "f"=>6} ]
# p split_hash_by_key( {:a => 1, :b => 2}, :a ) # returns [ {:a => 1, :b => 2} ]
# p split_hash_by_key( { :a=>1, :b=>2, :c=>3, :d=>4, :e=>5, :f=>6 }, 'b' ) # raises an exception





=begin
Your task is to write a function that takes two or more objects and returns a new object which combines all the input objects.

All input object properties will have only numeric values. Objects are combined together so that the values of matching keys are added together.

An example:

objA = { 'a' => 10, 'b' => 20, 'c' => 30 }
objB = { 'a' => 3, 'c' => 6, 'd' => 3 }
combine(objA, objB) # Returns { a => 13, b => 20, c => 36, d => 3 }
The combine function should be a good citizen, so should not mutate the input objects.

def combine(*arr_of_hashes)
  result = Hash.new(0)
  arr_of_hashes.each do |hsh|
    hsh.each { |k, v| result[k] += v }
  end
  result
end
=end