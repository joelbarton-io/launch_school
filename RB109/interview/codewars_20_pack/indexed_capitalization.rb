=begin

input: string and array of integers representing indices
goal: capitalize all letters at the provided indicies

algo:
conditions: 
- no idx can be greater than the length of the string itself
- all lowercase, no spaces in input string
- added functionality to deal with negative indicies

- iterate over integer array
- if current element is a negative integer, subtract string length and use that return
- the current element must be less than or equal to the length of the string
  - then modify that string element
  - otherwise, go next
- end loop
=end

def capitalize(plaintext, indicies)
  arr = plaintext.chars
  indicies.each do |idx|
    idx += arr.size if idx < 0
    arr[idx].upcase! if idx <= arr.size
  end
  arr.join
end
