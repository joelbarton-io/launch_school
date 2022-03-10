=begin
input: iterable, sorted list [array] or 'string'
output: new list that preserves original order, lacking in duplicate, adjacent values

algo: 
- convert to array if input is a string, otherwise continue
- make uniq, or squeeze, to remove adjacent same values       -> ended up not using either method
- return new array
=end

def unique_in_order(iterable)
  if iterable.is_a? String 
    iterable = iterable.chars 
  end

  arr = []
  iterable.each do |el| 
    arr << el if el != arr.last
  end
  arr
end

=begin
Refactored algo:
- convert to array if input is a string
- iterate over input, add element to new array if that element is different than the next element
- return new array object
=end

p unique_in_order('AAAABBBCCDAABBB')
p unique_in_order('ABBCcAD')
p unique_in_order([1, 2, 2, 3, 3])
# p '123456789645314'.split('').max_by(3) {|letter| letter.ord}.map! { |number| number.to_i}