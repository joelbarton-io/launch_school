=begin

i: string 
o: array of substrings

algo:
- iterate over with indexes
  - add sub strings to output array 
- check if last elem in output array has a size of less than 2
- if yes, append _ to last elem in array
- return output array

=end

def solution(string)
  last = string.slice!(-1) if string.length.odd?
  output = string.scan(/../)
  output << (last + '_') if last
  output
end


p solution('asdfjkl;fdsaa')