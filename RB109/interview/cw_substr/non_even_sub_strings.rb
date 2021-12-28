=begin

problem: 
i: string of integers
o: number of odd-numbered substrings

example:
"1341", they are 1, 1, 3, 13, 41, 341, 1341 => solve("1341") = 7

data-structure:
array, because we will be creating sub arrays OR strings?

algo:
- first, split by character, initialize storage array
- second, traverse over array elements and indexes
- third, initialize an additional counter and an adaptive end point
- fourth, get all substrings from current element to the end of the array
- fifth, push the subarrays into the storage array
- increment the counter

- now we have all subarrays, calculate the number of odd integer arrays present

=end
def solve(s) 
  array = s.chars
  storage = []
  
  array.each.with_index do |_, idx|
    take = 1
    end_point = array.length - idx
    until take > end_point do
      storage << array.slice(idx, take).join
      take += 1
    end
  end
  storage.select {|str| str.to_i.odd?}.size
end

p solve '1341'
