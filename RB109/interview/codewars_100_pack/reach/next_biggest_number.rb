=begin

i: positive integer
o: next 'biggest' integer by rearranging num's digits

goal: rearrange digits such that the number they form is the smallest increase

implicit:
  -> if all digits are the same -> return nil 

ds: int -> arr -> sub_arrs -> integers arr -> int/nil 

algo:

RENDER number as an array  
      || guard clause for all same
GET all permutations of that number -> STORE them as integers in an array

REMOVE all that are smaller than original input number
  -> return nil if resulting arr is empty
GET min of the numbers that remain -> this is our number
=end

def next_bigger(n)
  number = n.digits.reverse
  return nil if number.uniq.size.eql?(1)
  candidates = []
  number.permutation do |candi|
    candidates << candi.join.to_s
  end
  greater_than_n = candidates.select {|candi| candi > n}
  return nil if greater_than_n.empty?
  greater_than_n.min
end

